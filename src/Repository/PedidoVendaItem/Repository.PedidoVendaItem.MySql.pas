unit Repository.PedidoVendaItem.MySql;

interface

uses
  FireDAC.stan.Param,
  FireDAC.Comp.Client,
  Repository.PedidoVendaItem.Interfaces,
  Dto.ItemPedidoVenda;

type
  TRepositoryPedidoVendaItemMySql = class(TInterfacedObject, IRepositoryPedidoVendaItem)
  private
    function GetSqlIncluir: String;
    function GetSqlAlterar: String;
  public
    procedure Incluir(AItemPedidoVenda: TDtoItemPedidoVenda);
    procedure Alterar(AItemPedidoVenda: TDtoItemPedidoVenda);
  end;


implementation

uses
  Model.Conexao;

{ TRepositoryPedidoVendaItemMySql }

procedure TRepositoryPedidoVendaItemMySql.Alterar(
  AItemPedidoVenda: TDtoItemPedidoVenda);
var
  LQuery: TFDQuery;
begin
  LQuery := TModelConexao.Instance.GetQuery;
  try
    LQuery.SQL.Text := GetSqlAlterar;
    LQuery.ParamByName('codigo').AsInteger := AItemPedidoVenda.Codigo;
    LQuery.ParamByName('numero_pedido_venda').AsInteger := AItemPedidoVenda.NumeroPedido;
    LQuery.ParamByName('codigo_produto').AsInteger := AItemPedidoVenda.CodigoProduto;
    LQuery.ParamByName('quantidade').AsInteger := AItemPedidoVenda.Quantidade;
    LQuery.ParamByName('valor_unitario').AsFloat := AItemPedidoVenda.ValorUnitario;
    LQuery.ParamByName('valor_total').AsFloat := AItemPedidoVenda.ValorTotal;
    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

function TRepositoryPedidoVendaItemMySql.GetSqlAlterar: String;
begin
  Result := 'update pedido_venda_item set numero_pedido_venda = :numero_pedido_venda, ' +
            '                             codigo_produto = :codigo_produto, ' +
            '                             quantidade = :quantidade, ' +
            '                             valor_unitario = :valor_unitario, ' +
            '                             valor_total = :valor_total ' +
            ' where codigo = :codigo ';
end;

function TRepositoryPedidoVendaItemMySql.GetSqlIncluir: String;
begin
  Result := 'insert into pedido_venda_item (numero_pedido_venda, codigo_produto, ' +
            '                               quantidade, valor_unitario, valor_total) ' +
            '                       values (:numero_pedido_venda, :codigo_produto, ' +
            '                               :quantidade, :valor_unitario, :valor_total) ';
end;

procedure TRepositoryPedidoVendaItemMySql.Incluir(
  AItemPedidoVenda: TDtoItemPedidoVenda);
var
  LQuery: TFDQuery;
begin
  LQuery := TModelConexao.Instance.GetQuery;
  try
    LQuery.SQL.Text := GetSqlIncluir;
    LQuery.ParamByName('numero_pedido_venda').AsInteger := AItemPedidoVenda.NumeroPedido;
    LQuery.ParamByName('codigo_produto').AsInteger := AItemPedidoVenda.CodigoProduto;
    LQuery.ParamByName('quantidade').AsInteger := AItemPedidoVenda.Quantidade;
    LQuery.ParamByName('valor_unitario').AsFloat := AItemPedidoVenda.ValorUnitario;
    LQuery.ParamByName('valor_total').AsFloat := AItemPedidoVenda.ValorTotal;
    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

end.
