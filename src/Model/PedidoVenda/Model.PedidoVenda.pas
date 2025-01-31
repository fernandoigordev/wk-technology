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
    procedure Incluir(APedidoVenda: TDtoPedidoVenda);
    procedure Alterar(APedidoVenda: TDtoPedidoVenda);
    procedure ExcluirPedidoVenda(ANumeroPedido: Integer);
    procedure ExcluirItemPedido(APedidoVenda: TDtoPedidoVenda; ACodigoItemExcluir: Integer);

    constructor Create(ARepository: IRepositoryPedidoVenda);
  end;

implementation

{ TPedidoVenda }

procedure TPedidoVenda.Alterar(APedidoVenda: TDtoPedidoVenda);
begin
  FRepositoryPedidoVenda.Alterar(APedidoVenda);
end;

function TPedidoVenda.CodigoCliente(AValue: Integer): IModelPedidoVenda;
begin
  Result := Self;
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
  Result := Self;
  FDataEmissao := AValue;
end;

procedure TPedidoVenda.ExcluirItemPedido(APedidoVenda: TDtoPedidoVenda;
  ACodigoItemExcluir: Integer);
begin
  FRepositoryPedidoVenda.ExcluirItemPedido(APedidoVenda, ACodigoItemExcluir);
end;

procedure TPedidoVenda.ExcluirPedidoVenda(ANumeroPedido: Integer);
begin
  FRepositoryPedidoVenda.ExcluirPedidoVenda(ANumeroPedido);
end;

function TPedidoVenda.DataEmissao: TDate;
begin
  Result := FDataEmissao;
end;

function TPedidoVenda.GetLista: TObjectList<TDtoPedidoVenda>;
begin
  Result := FRepositoryPedidoVenda.GetListaPedido;
end;

procedure TPedidoVenda.Incluir(APedidoVenda: TDtoPedidoVenda);
begin
  FRepositoryPedidoVenda.Incluir(APedidoVenda);
end;

function TPedidoVenda.Itens(
  AValue: TList<IModelItemPedidoVenda>): IModelPedidoVenda;
begin
  Result := Self;
  FItens := AValue;
end;

function TPedidoVenda.Itens: TList<IModelItemPedidoVenda>;
begin
  Result := FItens;
end;

function TPedidoVenda.Numero(AValue: Integer): IModelPedidoVenda;
begin
  Result := Self;
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
  Result := Self;
  FValorTotal := AValue;
end;

end.
