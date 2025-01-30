unit Dto.PedidoVenda;

interface

uses
  Dto.ItemPedidoVenda,
  System.Generics.Collections;

type
  TDtoPedidoVenda = class
  private
    FNumero: Integer;
    FCodigoCliente: Integer;
    FDsCliente: String;
    FDataEmissao: TDate;
    FValorTotal: Double;
    FItens: TObjectList<TDtoItemPedidoVenda>;
  public
    property Numero: Integer read FNumero write FNumero;
    property CodigoCliente: Integer read FCodigoCliente write FCodigoCliente;
    property DsCliente: String read FDsCliente write FDsCliente;
    property DataEmissao: TDate read FDataEmissao write FDataEmissao;
    property ValorTotal: Double read FValorTotal write FValorTotal;
    property Itens: TObjectList<TDtoItemPedidoVenda> read FItens write FItens;

    constructor Create;
    destructor Destroy;override;
  end;

implementation

{ TDtoPedidoVenda }

constructor TDtoPedidoVenda.Create;
begin
  FItens := TObjectList<TDtoItemPedidoVenda>.Create;
end;

destructor TDtoPedidoVenda.Destroy;
begin
  FItens.Free;
  inherited;
end;

end.
