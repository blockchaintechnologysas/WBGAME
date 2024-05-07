// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// Opt 5000 Red Scolcoin (Scol wei Chain)
//*********************************************************************
// BLOCKCHAIN TECHNOLOGY SOLUTIONS AND ARTIFICIAL INTELLIGENCE AI S.A.S
//*********************************************************************
// Licencias Software World Business Game podras verificar esta licencia
// en https://idblk.com/licencia/ logeandose en su dasboard
// LICENCIA Colombia - Valle del Cauca - Yotoco (LIC_CoVaYo)

// Importar las interfaces ERC20, ERC1155 y ERC721
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.6.0/contracts/utils/Strings.sol";

contract Licencia_CO_VA_Yotoco is ERC721Enumerable, Ownable {
    using Strings for uint256;

    // Variable para el máximo número de licencias permitidas
    uint256 public constant MAX_LICENSES = 373000000; // Cambia este valor según tu necesidad
    // Variable para llevar el registro de cuántas licencias se han creado
    uint256 public licensesCreated;
    uint256 public consecutivo;

    // Constantes para definir valores específicos
    uint256 public MAX_AMOUNT = 500000; // Cambia este valor según tu necesidad
    uint256 private constant DEFAULT_VESES = 10; // Cambia este valor según tu necesidad

    // Direccion del token COP
    address public copAddress;
    // Direccion del otro token (ERC20)
    address public otherTokenAddress;
    // Direccion de la billetera para recibir COP
    address private walletCop;
    // Precio en COP de una licencia
    uint256 private LICENSE_PRICE = 10000 ether;
    uint256 public veces = DEFAULT_VESES;
    

    // Rango de licencias para Yotoco
    uint256 private constant YOTOCO_MIN = 1;
    uint256 private constant YOTOCO_MAX = 373000000;

    // Evento para registrar los intercambios
    event TokensExchanged(address indexed user, uint256 amount);
    // Evento para registrar la compra de licencia
    event LicensePurchased(address indexed user, uint256 tokenId);

    // Constructor del contrato
    constructor(address _TokenCOP, address _TokenWBG, address _walletCOP) ERC721("Licencia Yotoco", "Lic_Yotoco") {
        copAddress = _TokenCOP;
        otherTokenAddress = _TokenWBG;
        walletCop = _walletCOP;
    }

    // Función para comprar tokens y crear licencias
    function buyLIC(uint256 _amount) external {
        // Verificar que el monto sea superior a 500
        require(_amount >= veces, "El monto debe ser superior");

        // Verificar que el monto no supere el límite máximo de COP
        require(_amount <= MAX_AMOUNT, "El monto supera el limite maximo");

        // Verificar que no se exceda el número máximo de licencias
        require(licensesCreated + _amount <= MAX_LICENSES, "Se ha alcanzado el limite de licencias");

        // Instanciar el contrato del token COP y otros contratos
        IERC20 copToken = IERC20(copAddress);
        // Instanciar el contrato del otro token (ERC20)
        IERC20 otherToken = IERC20(otherTokenAddress);
        
        // Escalar el monto de COP 
        uint256 scaledAmount = _amount * LICENSE_PRICE;
        
        // Transferir los COP desde el remitente al contrato
        require(copToken.transferFrom(msg.sender, address(this), scaledAmount), "La transferencia de COP fallo");

        // Calcular la cantidad de tokens a entregar (solo la parte entera)
        uint256 tokensAmount = _amount;

        // Transferir los tokens (ERC20) al remitente
        require(otherToken.transfer(msg.sender, tokensAmount), "La transferencia de tokens fallo");

        // Transferir los COP a la billetera designada
        require(copToken.transfer(walletCop, scaledAmount), "La transferencia de COP a la billetera fallo");

        // Emitir el evento de intercambio
        emit TokensExchanged(msg.sender, tokensAmount);

        // Crear y asignar múltiples licencias al comprador
        for (uint256 i = 0; i < _amount; i++) {
            // Verificar que no se exceda el número máximo de licencias
            require(licensesCreated < MAX_LICENSES, "Se ha alcanzado el limite de licencias");

            // Obtener el número único de la licencia
            uint256 tokenId = getNextTokenId();

            // Incrementar el contador de licencias creadas
            licensesCreated++;
            consecutivo=licensesCreated+YOTOCO_MIN;

            // Emitir el evento de compra de licencia
            emit LicensePurchased(msg.sender, tokenId);

            // Resto del código para crear y asignar licencias omitido para mayor claridad
            _safeMint(msg.sender, tokenId);
        }
    }

    // Funcion para obtener el saldo de otro token en el contrato (escalado a 1 ether)
    function getTokenBalance() public view returns (uint256) {
        // Instanciar el contrato del otro token (ERC20)
        IERC20 otherToken = IERC20(otherTokenAddress);
        // Obtener el saldo del otro token en el contrato y escalarlo a 1 ether
        return otherToken.balanceOf(address(this)) / 1 ether;
    }

    // Funcion para activar la kill del contrato
    function kill(bool _confirmation) external onlyOwner {
        require(_confirmation == true, "La confirmacion debe ser verdadera");
        // Instanciar el contrato del token otherToken
        IERC20 otherToken = IERC20(otherTokenAddress);
        // Obtener el saldo de otherToken en el contrato
        uint256 balance = otherToken.balanceOf(address(this));
        // Transferir todo el saldo de otherToken a la billetera del propietario
        require(otherToken.transfer(owner(), balance), "La transferencia de otherToken a la billetera fallo");
    }

    // Funcion para actualizar el precio de la licencia
    function updateLicensePrice(uint256 _newPrice) external onlyOwner {
        LICENSE_PRICE = _newPrice;
    }

    //funcion actualizar el maximo
    function updatmax(uint256 _newMax) external onlyOwner {
        MAX_AMOUNT = _newMax;
    }

    // Funcion para actualizar veces
    function updateveces(uint256 _newveces) external onlyOwner {
        veces = _newveces;
    }

    // Funcion para obtener el precio actual de la licencia
    function getLicensePrice() public view returns (uint256) {
        return LICENSE_PRICE / 1 ether;
    }

    // Funcion de fallback para rechazar ether enviado directamente al contrato
    receive() external payable {
        revert("Este contrato no acepta ether.");
    }

    // Función para obtener el próximo número de token único
    function getNextTokenId() view private returns (uint256) {
        uint256 nextTokenId = licensesCreated + 1;

        // Verificar si la nueva licencia está en el rango de Yotoco
        if (nextTokenId >= YOTOCO_MIN && nextTokenId <= YOTOCO_MAX) {
            // Si es así, devolver el número de token directamente
            return nextTokenId;
        } else {
            // En otro caso, buscar el siguiente número de token en el rango de Yotoco
            for (uint256 i = YOTOCO_MIN; i <= YOTOCO_MAX; i++) {
                if (!_exists(i)) {
                    return i;
                }
            }
        }

        revert("No se pudo encontrar un numero de token unico en el rango de Yotoco");
    }

    // Función para validar si un usuario es propietario de una licencia específica
    function validateLicenseOwnership(uint256 _tokenId) public view returns (bool) {
        // Verificar si el token existe
        require(_exists(_tokenId), "El token no existe");

        // Obtener el propietario actual del token
        address owner = ownerOf(_tokenId);

        // Verificar si el propietario del token es el mismo que el que llama a esta función
        return owner == msg.sender;
    }

   function tokenURI(uint256 _tokenId) public view override returns (string memory) {
    require(_exists(_tokenId), "El token no existe");
    
    string memory baseURI = "https://idblk.com/licencia/?id=";
    
    uint256 uniqueCode = getUniqueCode(_tokenId);
    require(uniqueCode >= YOTOCO_MIN && uniqueCode <= YOTOCO_MAX, "El token esta fuera del rango de Yotoco");
    
    string memory uniqueCodeString;
    
    if (uniqueCode >= YOTOCO_MIN && uniqueCode <= YOTOCO_MAX) {
        uniqueCodeString = uint256ToString(uniqueCode);
    } else {
        // Ajustar el uniqueCode para reflejar el cambio en el rango
        uint256 adjustedUniqueCode = uniqueCode - (YOTOCO_MIN - 1); // Restar (YOTOCO_MIN - 1) para ajustar el rango
        uniqueCodeString = uint256ToString(adjustedUniqueCode);
    }
    
    return string(abi.encodePacked(baseURI, uniqueCodeString));
}





    // Función para obtener el código de rango único de la licencia
    function getUniqueCode(uint256 _tokenId) private view returns (uint256) {
        require(_exists(_tokenId), "El token no existe");

        uint256 uniqueCode;
        // Verificar si el token está en el rango de Yotoco
        if (_tokenId >= YOTOCO_MIN && _tokenId <= YOTOCO_MAX) {
            uniqueCode = _tokenId;
        } else {
            uniqueCode = MAX_LICENSES - _tokenId + 1; // Invertir el rango para Darien
        }
        return uniqueCode;
    }

    // Función auxiliar para convertir uint256 a string
    function uint256ToString(uint256 value) private pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
