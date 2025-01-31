unit Repository.Cliente.Interfaces;

interface

uses
  Dto.Cliente;

type
  IRepositoryCliente = interface
    ['{885DF5BC-3A7B-4181-B734-121A634E20AC}']
    function GetCliente(ACodigo: Integer): TDtoCliente;
  end;

implementation

end.
