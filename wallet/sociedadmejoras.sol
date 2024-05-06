// SPDX-License-Identifier: MIT
// Opt 5000 Red Scolcoin (Scol wei Chain)
//*********************************************************************
// BLOCKCHAIN TECHNOLOGY SOLUTIONS AND ARTIFICIAL INTELLIGENCE AI S.A.S
//*********************************************************************
//# locked 12 meses Fondo(1%) para el Sociedad Mejoras de WB GAME METAVERSO

// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

// File: contracts/sociedadmejoras.sol


pragma solidity ^0.8.0;


contract SociedadMejoras_WBGAME {
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
