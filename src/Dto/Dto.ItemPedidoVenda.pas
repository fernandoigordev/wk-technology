unit Dto.ItemPedidoVenda;

interface

type
  TDtoItemPedidoVenda = class
  private
    FCodigo: Integer;
    FNumeroPedido: Integer;
    FCodigoProduto: Integer;
    FDsProduto: String;
    FQuantidade: Integer;
    FValorUnitario: Double;
    FValorTotal: Double;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property CodigoProduto: Integer read FCodigoProduto write FCodigoProduto;
    property DsProduto: String read FDsProduto write FDsProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;
    property ValorTotal: Double read FValorTotal write FValorTotal;
  end;

implementation

end.
