// SPDX-License-Identifier: MIT
// Opt 5000 Red Scolcoin (Scol wei Chain) Direccion: 0x54A191fb62413B839ACADD7cFB6930CD2d58aAb9
//*********************************************************************
// BLOCKCHAIN TECHNOLOGY SOLUTIONS AND ARTIFICIAL INTELLIGENCE AI S.A.S
//*********************************************************************
//# Wallet de Distribucion WB GAME METAVERSO

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC-20 standard as defined in the ERC.
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
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
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
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

// File: contracts/distriwallet.sol


pragma solidity ^0.8.0;


contract Distribucion_WBGAME {
    address public owner;
    uint256 private constant PORCENTAJE_TOTAL = 1000; // Total de 1000 para manejar decimales (0.5% = 5 de 1000)

    struct Wallet {
        address walletAddress;
        uint256 porcentaje;
    }

    Wallet[] public wallets;
    uint256 private totalPorcentaje;

    modifier soloPropietario() {
        require(msg.sender == owner, "Acceso no autorizado");
        _;
    }

    constructor() {
        owner = msg.sender;
        // Configurar las wallets y sus respectivos porcentajes
        configurarWallets();
    }

    // Configurar las wallets y sus porcentajes
    function configurarWallets() internal {
        wallets.push(Wallet(0x01667E6fedBF020df3C51EB70Ab8420194332a8b, 10)); // 1-Ecoduende 1%
        wallets.push(Wallet(0x9CD221aF2345cAF47f76D1Bc5F1231E025F644Ce, 10)); // 2-Deporte 1%
        wallets.push(Wallet(0x3858365e6c5eE92f38ebb30a8a53D3DA3808484B, 10)); // 3-Sociedad mejoras 1%
        wallets.push(Wallet(0xf9b34810518b5f848eFaE7005cE0B5503deCC781, 5)); // 4-Desarrollo 0.5%
        wallets.push(Wallet(0x5D92CCe873B1A30762796f60444252700a8dfbEA, 5)); // 5-Mercadeo 0.5%
        wallets.push(Wallet(0x7971cEAA6A060061fa892C13f48422FBC319f1D9, 10)); // 6-Eventos Blockchain 1%
        wallets.push(Wallet(0xA09756f307169048e260aa2E47676F467d5BAd92, 10)); // 7-Asesor Al 1%
        wallets.push(Wallet(0x989e3194Db6Aae37bEeCfacE9d1ec4de47048563, 10)); // 8-Asesor MC 1%
        wallets.push(Wallet(0x7BFC7F4846a7668018adFcd2e992b7eA0353d201, 5)); // 9-Estudiantes multimedia 0.5%
        wallets.push(Wallet(0x001D60b801a2Cae3025fD4A217403A2EB264d6F7, 5)); // 10-Estudiantes diseño 0.5%
        wallets.push(Wallet(0xd5541c13e1BEC4eefB1d95BFbdA84d3c97ab5236, 5)); // 11-Realidad Aumentada (AR) 0.5%
        wallets.push(Wallet(0x85920cb6F8234B731abEb40123F581B48179bF6F, 5)); // 12-Ingeniería de Realidad Virtual (VR) 0.5%
        wallets.push(Wallet(0xd1e54C98a6fC1e721309b9192E22AC81Ade3a69A, 10)); // 13-Estudiantes arquitectura 1%
        wallets.push(Wallet(0x733DC5bE82D34b5a3F6489e40fb384F49cdCD9E4, 10)); // 14-Estudiantes sistemas 1%
        wallets.push(Wallet(0x6144fDa69b4dE5725DE4ed7CBf2F26e96d3cb76C, 5)); // 15-Estudiantes ai 0.5%
        wallets.push(Wallet(0x0982A3b3Fc61a9F7282C7C1C1025aab5216D53c7, 10)); // 16-Desarrollo de Juegos 1%
        wallets.push(Wallet(0x5493023045CCcB9b79A6dF5d691bB29369908534, 10)); // 17-Estudiantes mercadeo 1%
        wallets.push(Wallet(0x673179726016444Ff2E44cF5d397801b01cf8Cc8, 10)); // 18-Identidad 1%
        wallets.push(Wallet(0x72ed96A0BC4161500Af4a770F0f08fC47c973796, 10)); // 19-Comisiones 1%
        wallets.push(Wallet(0x40771B3669709302982B14FE8E3aCB9d2daAA608, 100)); //20-Sueldos 10%
        wallets.push(Wallet(0x651247C089843869368F3277de7f9f2C1bc09B59, 100)); //21-Metaverso 10%
        wallets.push(Wallet(0x2c058BBBb72a981436386aB97176745Fa2E2B67f, 180)); //22-Inversiones 18%
        wallets.push(Wallet(0x8777AE7858E1Fc23D2ce49Edd752A3d174899e31, 180)); //23-Inversiones en Tecnologia 18%
        wallets.push(Wallet(0x92437953db53C3C0D1B9cb0F3B3A8b39A07463b5, 100)); //24-Compra Acciones 10%
        wallets.push(Wallet(0x2a9395f02FEDbd099A90101f870C683F8FD8f845, 90)); // 25-Recompra Token WBGAME 9%
        wallets.push(Wallet(0xC68e8277453f31Bc92854b0fd2181ec16cBd9797, 10)); // 26-Recompra Scol Wei Chain 1%
        wallets.push(Wallet(0xB969A92Ed99DE3A59e9CB20c3473071fB00532D8, 5)); //  27-Recompra Scolcoin Nativos 0.5%
        wallets.push(Wallet(0x271cbc184F4183118D4eDb72Bd8c9fb184839FB0, 80)); // 28-Otras Inversiones 8%
    
    // Realizar la suma de los porcentajes
        
        for (uint256 i = 0; i < wallets.length; i++) {
            require(totalPorcentaje + wallets[i].porcentaje >= totalPorcentaje, "Desbordamiento de suma detectado");
            totalPorcentaje += wallets[i].porcentaje;
        }
        
        // Verificar si la suma de los porcentajes es 1000
        require(totalPorcentaje == 1000, "La suma de los porcentajes no es igual a 1000");
    
    }

    
    // Distribuir tokens a las wallets
    function distribuirTokens(IERC20 token, uint256 cantidad) internal {
        for (uint256 i = 0; i < wallets.length; i++) {
            uint256 tokensAEnviar = (cantidad * wallets[i].porcentaje) / PORCENTAJE_TOTAL;
            require(token.transfer(wallets[i].walletAddress, tokensAEnviar), "Fallo la transferencia de tokens");
        }
    }

    // Función para obtener el balance de un token
    function consultarBalance(address tokenAddress) public view returns (uint256) {
        IERC20 token = IERC20(tokenAddress);
        return token.balanceOf(address(this));
    }

    // Retirar tokens sobrantes (si los hay) y distribuirlos
    function retirarTokens(address tokenAddress) external soloPropietario {
        IERC20 token = IERC20(tokenAddress);
        uint256 balance = token.balanceOf(address(this));
        require(balance > 0, "No hay tokens para retirar");

        address[] memory direcciones = new address[](wallets.length);
        uint256[] memory tokensPorEnviar = new uint256[](wallets.length);
        
        // Calcular tokens a enviar para cada dirección
        for (uint256 i = 0; i < wallets.length; i++) {
            tokensPorEnviar[i] = (balance * wallets[i].porcentaje) / PORCENTAJE_TOTAL;
            direcciones[i] = wallets[i].walletAddress;
        }

        // Transferir los tokens a todas las direcciones en una sola transacción
        for (uint256 i = 0; i < direcciones.length; i++) {
            require(token.transfer(direcciones[i], tokensPorEnviar[i]), "Fallo la transferencia de tokens");
        }
    }
}
