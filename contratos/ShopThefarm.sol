/* SPDX-License-Identifier: MIT
 File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/token/ERC20/IERC20.sol
 Opt 5000 Red Scolcoin (Scol wei Chain)
*********************************************************************
 BLOCKCHAIN TECHNOLOGY SOLUTIONS AND ARTIFICIAL INTELLIGENCE AI S.A.S
*********************************************************************
 Numero de Registro Tributario (NIT): 901676524-7
 ------------------------------------------------
 Licencias CAL Software World Business Game podras verificar esta licencia
 en https://idblk.com/licencia/ logeandose en su dasboard
 LICENCIA NFT WBGAME - THEFARM y Sanctuary total 950.000
 valor CAL 100.000 SCOL + IVA (19%) = 119.000 SCOL
 Marco Legal: Factura Electronica, Licencia CAL, Certificado CAL 
*/

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

// File: contracts/shopmeta.sol


pragma solidity ^0.8.0;

// Importar las interfaces ERC20


contract ShopFarmSCOL {
    // Dirección del token SCOL
    address public scolAddress;
    // Dirección del otro token (ERC20)
    address public otherTokenAddress;
    // Dirección del propietario del contrato
    address public owner;
    // Dirección de la billetera para recibir SCOL
    address private walletScol;
    // Variable para almacenar el valor de conversión de SCOL a Token
    uint256 public varSCOL;
    // Constante para definir el monto máximo de SCOL permitido
    uint256 public constant MAX_SCOL_AMOUNT = 253;
    // Faucet
    bool public faucet;
    // Contador para los envíos de NFTs
    uint256 public shipmentCounter;

    // Estructura para almacenar la información de los envíos pendientes de NFTs
    struct NFTShipment {
        uint256 id;
        address walletClient;
        uint256 nftAmount;
        bool status;
    }

    // Mapeo para almacenar los envíos pendientes de NFTs
    mapping(uint256 => NFTShipment) public nftShipments;
    // Lista de IDs de clientes para facilitar la lectura
    uint256[] public clientIds;

    // Evento para registrar los intercambios
    event TokensExchanged(address indexed user, uint256 amount);
    event NFTShipmentUpdated(uint256 id, bool status);

    // Constructor del contrato
    constructor(address _TokenSCOL, address _TokenWBG, address _walletSCOL) {
        scolAddress = _TokenSCOL;
        otherTokenAddress = _TokenWBG;
        walletScol = _walletSCOL;
        owner = msg.sender; // Guardar la dirección del creador del contrato como propietario
        varSCOL = (100000 + 19000) * 1 ether; // 119000 SCOL por 1 Token (119000 * 10^18) IVA 19% (19000) de la Licencia CA
        shipmentCounter = 0; // Inicializar el contador de envíos
    }

    // Función para intercambiar SCOL por otro token
    function buyTokens(uint256 _amount, address _referrer) external {
        // Verificar que el monto sea superior a 1
        require(_amount >= 1, "El monto debe ser superior a 1");

        // Verificar que el monto no supere el límite máximo de SCOL
        require(_amount <= MAX_SCOL_AMOUNT, "El monto supera el limite maximo");

        // Instanciar el contrato del token SCOL
        IERC20 scolToken = IERC20(scolAddress);
        // Instanciar el contrato del otro token (ERC20)
        IERC20 otherToken = IERC20(otherTokenAddress);

        // Escalar el monto de SCOL
        uint256 scaledAmount = _amount * varSCOL;
        
        // Transferir los SCOL desde el remitente al contrato
        require(scolToken.transferFrom(msg.sender, address(this), scaledAmount), "La transferencia de SCOL fallo");

        // Calcular la cantidad de tokens a entregar (solo la parte entera)
        uint256 tokensAmount = _amount;

        // Transferir los tokens (ERC20) al remitente
        require(otherToken.transfer(msg.sender, tokensAmount), "La transferencia de tokens fallo");

        // Calcular el 5% del valor comprado en SCOL
        uint256 referralAmount = (scaledAmount * 5) / 100;

        // Calcular la cantidad de tokens a entregar al 5% en SCOL
        uint256 calenviar = (referralAmount / varSCOL);

        // Transferir el 5% del valor comprado en SCOL al referenciado en forma de tokens del contrato otherTokenAddress
        require(otherToken.transfer(_referrer, calenviar), "La transferencia de tokens de referido fallo");

        // Registrar la información para el envío de NFTs
        shipmentCounter++;
        nftShipments[shipmentCounter] = NFTShipment({
            id: shipmentCounter,
            walletClient: msg.sender,
            nftAmount: _amount,
            status: false
        });

        // Añadir el ID del cliente a la lista de IDs
        clientIds.push(shipmentCounter);

        // Transferir los SCOL a la billetera designada
        require(scolToken.transfer(walletScol, scaledAmount), "La transferencia de SCOL a la billetera fallo");

        // Emitir el evento de intercambio
        emit TokensExchanged(msg.sender, tokensAmount);
    }

    // Función para actualizar el estado de un envío de NFT
    function updateNFTShipmentStatus(uint256 _id, bool _status) external onlyOwner {
        require(_id > 0 && _id <= shipmentCounter, "ID de envio no valido");
        NFTShipment storage shipment = nftShipments[_id];
        shipment.status = _status;

        // Emitir el evento de actualización de envío
        emit NFTShipmentUpdated(_id, _status);
    }

    // Función para obtener el saldo de otro token en el contrato (escalado a 1 ether)
    function getTokenBalance() public view returns (uint256) {
        // Instanciar el contrato del otro token (ERC20)
        IERC20 otherToken = IERC20(otherTokenAddress);
        // Obtener el saldo del otro token en el contrato y escalarlo a 1 ether
        return otherToken.balanceOf(address(this)) / 1 ether;
    }

    // Función para que el administrador actualice la variable varSCOL
    function updateVarSCOL(uint256 _newVarSCOL) external onlyOwner {
        varSCOL = _newVarSCOL;
    }

    // Función para actualizar la variable faucet
    function updateFaucet(bool _status) external onlyOwner {
        faucet = _status;
    }

    // Función para activar la kill del contrato
    function kill(bool _confirmation) external onlyOwner {
        require(_confirmation == true, "La confirmacion debe ser verdadera");
        // Instanciar el contrato del token SCOL
        IERC20 scolToken = IERC20(scolAddress);
        // Obtener el saldo del contrato
        uint256 balance = scolToken.balanceOf(address(this));
        // Transferir todo el saldo del token a la billetera del propietario
        require(scolToken.transfer(owner, balance), "La transferencia de SCOL a la billetera fallo");
    }

    // Función de fallback para rechazar ether enviado directamente al contrato
    receive() external payable {
        revert("Este contrato no acepta ether.");
    }

    // Modificador para permitir que solo el propietario llame a ciertas funciones
    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede llamar a esta funcion");
        _;
    }
}

