// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// Opt 5000 Red Scolcoin (Scol wei Chain) direccion: 
//*********************************************************************
// BLOCKCHAIN TECHNOLOGY SOLUTIONS AND ARTIFICIAL INTELLIGENCE AI S.A.S
//*********************************************************************
// Licencias Software World Business Game podras verificar esta licencia
// en https://idblk.com/ logeandose en su dasboard

contract Codigos_Licencias_WBGAME {
    // Estructura para almacenar los datos
    struct Datos {
        string pais;
        string superficie;
        string municipio;
        string departamento;
        string inicio;
        string idfinal;
        uint256 precio;
    }
    
    // Mapeo para almacenar los datos por municipio
    mapping(string => Datos) datosPorMunicipio;

    // Dirección del dueño del contrato
    address public owner;

    // Contador para el total de datos almacenados
    uint256 public totalDatos;

    // Modificador para restringir el acceso a solo el dueño
    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede realizar esta accion");
        _;
    }

    // Evento para registrar la actualización de los datos
    event DatosActualizados(string municipio, string nuevoInicio, string nuevoFinal, uint256 nuevoPrecio);

    // Constructor
    constructor() {
        owner = msg.sender;
    }

    // Función para agregar datos
    function addDatos(
        string memory _pais,
        string memory _superficie,
        string memory _municipio,
        string memory _departamento,
        string memory _inicio,
        string memory _final,
        uint256 _precio
    ) public onlyOwner {
        require(bytes(_pais).length > 0, "El campo 'pais' es obligatorio");
        require(bytes(_superficie).length > 0, "El campo 'superficie' es obligatorio");
        require(bytes(_municipio).length > 0, "El campo 'municipio' es obligatorio");
        require(bytes(_departamento).length > 0, "El campo 'departamento' es obligatorio");
        require(bytes(_inicio).length > 0, "El campo 'inicio' es obligatorio");
        require(bytes(_final).length > 0, "El campo 'final' es obligatorio");
        require(_precio > 0, "El campo 'precio' debe ser mayor que cero");
        require(datosPorMunicipio[_municipio].precio == 0, "El municipio ya existe");

        datosPorMunicipio[_municipio] = Datos(_pais, _superficie, _municipio, _departamento, _inicio, _final, _precio);
        totalDatos++; // Incrementar el contador de datos
        emit DatosActualizados(_municipio, _inicio, _final, _precio);
    }

    // Función para buscar datos por municipio
    function buscarPorMunicipio(string memory _municipio) public view returns (
        string memory pais,
        string memory superficie,
        string memory departamento,
        string memory inicio,
        string memory idfinal,
        uint256 precio
    ) {
        Datos memory datos = datosPorMunicipio[_municipio];
        return (
            datos.pais,
            datos.superficie,
            datos.departamento,
            datos.inicio,
            datos.idfinal,
            datos.precio
        );
    }

    // Función para obtener el total de datos almacenados
    function getTotalDatosAlmacenados() public view returns (uint256) {
        return totalDatos;
    }

    // Función para modificar los datos existentes
    function modificarDatos(
        string memory _municipio,
        string memory _superficie,
        string memory _inicio,
        string memory _final,
        uint256 _precio
    ) public onlyOwner {
        require(bytes(_superficie).length > 0, "El campo 'superficie' es obligatorio");
        require(bytes(_municipio).length > 0, "El campo 'municipio' es obligatorio");
        require(bytes(_inicio).length > 0, "El campo 'inicio' es obligatorio");
        require(bytes(_final).length > 0, "El campo 'final' es obligatorio");
        require(_precio > 0, "El campo 'precio' debe ser mayor que cero");
        require(datosPorMunicipio[_municipio].precio > 0, "El municipio no existe");

        Datos storage datos = datosPorMunicipio[_municipio];
        datos.superficie = _superficie;
        datos.inicio = _inicio;
        datos.idfinal = _final;
        datos.precio = _precio;

        emit DatosActualizados(_municipio, _inicio, _final, _precio);
    }
}
