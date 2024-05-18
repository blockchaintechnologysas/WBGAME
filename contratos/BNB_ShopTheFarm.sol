// SPDX-License-Identifier: MIT
/* 
 File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/token/ERC20/IERC20.sol
 Opt 5000 Red Scolcoin (Scol wei Chain) direccion: 0x089328aF98ec725568D1750d3C48b1D81926B02E
 Opt 5000 Red BSC de Binance direccion: 0xb14f0D631AaD125A5bDbAf4E7bC42154205C304c
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
// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/utils/math/SafeMath.sol


// OpenZeppelin Contracts (last updated v4.6.0) (utils/math/SafeMath.sol)

pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/security/ReentrancyGuard.sol


// OpenZeppelin Contracts v4.4.1 (security/ReentrancyGuard.sol)

pragma solidity ^0.8.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

// File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/token/ERC20/IERC20.sol


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

// File: contracts/bnb_shopfarm.sol

/*
 File: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/token/ERC20/IERC20.sol
 Opt 5000 Red Scolcoin (Scol wei Chain) direccion: 0x089328aF98ec725568D1750d3C48b1D81926B02E
 Opt 5000 Red BSC de Binance direccion: 
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

pragma solidity ^0.8.0;

// Importar las interfaces ERC20 y otras bibliotecas de OpenZeppelin




contract ShopFarmWBG_SCOL is ReentrancyGuard {
    using SafeMath for uint256;

    // Dirección del token SCOL
    address public scolAddress;
    // Dirección del propietario del contrato
    address public owner;
    // Direcciones de los VPS autorizados
    address public vps1;
    address public vps2;
    // Dirección de la billetera para recibir SCOL
    address private walletScol;
    // Variable para almacenar el valor de conversión de SCOL a Token
    uint256 public varSCOL;
    // Constante para definir el monto máximo de SCOL permitido
    uint256 public constant MAX_SCOL_AMOUNT = 253;
    // Contador para los envíos de NFTs
    uint256 public shipmentCounter;

    // Estructura para almacenar la información de los envíos pendientes de NFTs
    struct NFTShipment {
        uint256 id;
        address walletClient;
        uint256 nftAmount;
    }

    // Mapeo para almacenar los envíos pendientes de NFTs
    mapping(uint256 => NFTShipment) public nftShipments;
    // Lista de IDs de clientes para facilitar la lectura
    uint256[] public clientIds;

    // Evento para registrar los intercambios
    event NFTShipmentUpdated(uint256 id, bool status);

    // Constructor del contrato
    constructor(address _TokenSCOL, address _walletSCOL, address _vps1, address _vps2) {
        scolAddress = _TokenSCOL;
        walletScol = _walletSCOL;
        owner = msg.sender; // Guardar la dirección del creador del contrato como propietario
        varSCOL = (100000 + 19000) * 1 ether; // 119000 SCOL por 1 Token (119000 * 10^18) IVA 19% (19000) de la Licencia CA
        shipmentCounter = 0; // Inicializar el contador de envíos
        vps1 = _vps1;
        vps2 = _vps2;
    }

    // Modificador para permitir que solo el propietario o los VPS autorizados llamen a ciertas funciones
    modifier onlyOwnerOrAuthorized() {
        require(msg.sender == owner || msg.sender == vps1 || msg.sender == vps2, "No autorizado");
        _;
    }

    // Función para intercambiar SCOL por otro token
    function buyTokens(uint256 _amount) external nonReentrant {
        // Verificar que el monto sea superior a 1
        require(_amount >= 1, "El monto debe ser superior a 1");

        // Verificar que el monto no supere el límite máximo de SCOL
        require(_amount <= MAX_SCOL_AMOUNT, "El monto supera el limite maximo");

        // Instanciar el contrato del token SCOL
        IERC20 scolToken = IERC20(scolAddress);

        // Escalar el monto de SCOL
        uint256 scaledAmount = _amount.mul(varSCOL);
        
        // Transferir los SCOL desde el remitente al contrato
        require(scolToken.transferFrom(msg.sender, address(this), scaledAmount), "La transferencia de SCOL fallo");


        // Registrar la información para el envío de NFTs
        shipmentCounter = shipmentCounter.add(1);
        nftShipments[shipmentCounter] = NFTShipment({
            id: shipmentCounter,
            walletClient: msg.sender,
            nftAmount: _amount
        });

        // Añadir el ID del cliente a la lista de IDs
        clientIds.push(shipmentCounter);

        // Transferir los SCOL a la billetera designada
        require(scolToken.transfer(walletScol, scaledAmount), "La transferencia de SCOL a la billetera fallo");

    }



    // Función para actualizar las direcciones de los VPS autorizados
    function updateVPSAddresses(address _newVps1, address _newVps2) external onlyOwner {
        vps1 = _newVps1;
        vps2 = _newVps2;
    }


    // Función para que el administrador actualice la variable varSCOL
    function updateVarSCOL(uint256 _newVarSCOL) external onlyOwner {
        varSCOL = _newVarSCOL;
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
