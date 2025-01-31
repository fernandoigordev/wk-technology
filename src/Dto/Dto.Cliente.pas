unit Dto.Cliente;

interface

type
  TDtoCliente = class
  private
    FCodigo: Integer;
    FNome: String;
    FCidade: String;
    FUf: String;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
    property Cidade: String read FCidade write FCidade;
    property Uf: String read FUf write FUf;
  end;

implementation

end.
