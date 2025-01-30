unit Model.PedidoVenda;

interface

uses
  System.Generics.Collections,
  Model.PedidoVenda.Interfaces,
  Model.ItemPedidoVenda.Interfaces,
  Dto.PedidoVenda,
  Repository.PedidoVenda.Interfaces;

type
  TPedidoVenda = class(TInterfacedObject, IModelPedidoVenda)
  private
    FNumero: Integer;
    FDataEmissao: TDate;
    FCodigoCliente: Integer;
    FValorTotal: Double;
    FItens: TList<IModelItemPedidoVenda>;
    FRepositoryPedidoVenda: IRepositoryPedidoVenda;
  public
    function Numero: Integer; overload;
    function DataEmissao: TDate; overload;
    function CodigoCliente: Integer; overload;
    function ValorTotal: Double; overload;
    function Itens: TList<IModelItemPedidoVenda>; overload;

    function Numero(AValue: Integer): IModelPedidoVenda; overload;
    function DataEmissao(AValue: TDate): IModelPedidoVenda; overload;
    function CodigoCliente(AValue: Integer): IModelPedidoVenda; overload;
    function ValorTotal(AValue: Double): IModelPedidoVenda; overload;
    function Itens(AValue: TList<IModelItemPedidoVenda>): IModelPedidoVenda; overload;

    function GetLista: TObjectList<TDtoPedidoVenda>;

    constructor Create(ARepository: IRepositoryPedidoVenda);
  end;

implementation

{ TPedidoVenda }

function TPedidoVenda.CodigoCliente(AValue: Integer): IModelPedidoVenda;
begin
  FCodigoCliente := AValue;
end;

constructor TPedidoVenda.Create(ARepository: IRepositoryPedidoVenda);
begin
  FRepositoryPedidoVenda := ARepository;
end;

function TPedidoVenda.CodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TPedidoVenda.DataEmissao(AValue: TDate): IModelPedidoVenda;
begin
  FDataEmissao := AValue;
end;

function TPedidoVenda.DataEmissao: TDate;
begin
  Result := FDataEmissao;
end;

function TPedidoVenda.GetLista: TObjectList<TDtoPedidoVenda>;
begin
  Result := FRepositoryPedidoVenda.GetListaPedido;
end;

function TPedidoVenda.Itens(
  AValue: TList<IModelItemPedidoVenda>): IModelPedidoVenda;
begin
  FItens := AValue;
end;

function TPedidoVenda.Itens: TList<IModelItemPedidoVenda>;
begin
  Result := FItens;
end;

function TPedidoVenda.Numero(AValue: Integer): IModelPedidoVenda;
begin
  FNumero := AValue;
end;

function TPedidoVenda.Numero: Integer;
begin
  Result := FNumero;
end;

function TPedidoVenda.ValorTotal: Double;
begin
  Result := ValorTotal;
end;

function TPedidoVenda.ValorTotal(AValue: Double): IModelPedidoVenda;
begin
  FValorTotal := AValue;
end;

end.
