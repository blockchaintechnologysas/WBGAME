// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//# locked Fondo para el Medio Ambiente de WB GAME METAVERSO

// Opt 5000 Red Scolcoin (Scol wei Chain)
//*********************************************************************
// BLOCKCHAIN TECHNOLOGY SOLUTIONS AND ARTIFICIAL INTELLIGENCE AI S.A.S
//*********************************************************************

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/token/ERC20/IERC20.sol";

contract AdminBatchSender {
    address public owner;
    uint256 public deploymentTime;
    uint256 public constant TIEMPO_ESPERA = 12 * 30 days * 24 hours; // 12 meses en segundos

    modifier soloPropietario() {
        require(msg.sender == owner, "Solo el propietario puede llamar a esta funcion");
        require(block.timestamp >= deploymentTime + TIEMPO_ESPERA, "El contrato aun no esta disponible para su uso");
        _;
    }

    constructor() {
        owner = msg.sender;
        deploymentTime = block.timestamp;
    }

    function tiempoRestanteParaUsar() public view returns (uint256) {
        uint256 tiempoTranscurrido = block.timestamp - deploymentTime;
        if (tiempoTranscurrido >= TIEMPO_ESPERA) {
            return 0;
        } else {
            return TIEMPO_ESPERA - tiempoTranscurrido;
        }
    }

    function enviarLote(address tokenAddress, address[] calldata destinatarios, uint256 cantidad) external soloPropietario {
        require(destinatarios.length > 0, "No se especificaron destinatarios");
        require(cantidad > 0, "La cantidad debe ser mayor que 0");

        IERC20 token = IERC20(tokenAddress);
        uint256 cantidadTotal = cantidad * destinatarios.length;

        require(token.balanceOf(address(this)) >= cantidadTotal, "Saldo insuficiente en el contrato");

        for (uint256 i = 0; i < destinatarios.length; i++) {
            token.transfer(destinatarios[i], cantidad);
        }
    }

    function retirarTokens(address tokenAddress, uint256 cantidad) external soloPropietario {
        require(cantidad > 0, "La cantidad debe ser mayor que 0");

        IERC20 token = IERC20(tokenAddress);
        token.transfer(owner, cantidad);
    }

    function retirarEther() external soloPropietario {
        payable(owner).transfer(address(this).balance);
    }

    receive() external payable {}
}
