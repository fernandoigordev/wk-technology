unit Repository.PedidoVenda.MySql;

interface

uses
  Repository.PedidoVenda.Interfaces,
  System.Generics.Collections,
  Dto.PedidoVenda;

type
  TRepositoryPedidoVendaMySql = class(TInterfacedObject, IRepositoryPedidoVenda)
  private
    function GetSqlListaPedido: String;
  public
    function GetListaPedido: TObjectList<TDtoPedidoVenda>;
  end;

implementation

uses
  Model.Conexao,
  FireDAC.Comp.Client,
  Dto.ItemPedidoVenda;

{ TRepositoryPedidoVendaMySql }

function TRepositoryPedidoVendaMySql.GetListaPedido: TObjectList<TDtoPedidoVenda>;
var
  LQuery: TFDQuery;
  LPedidoVenda: TDtoPedidoVenda;
  LItemPedidoVenda: TDtoItemPedidoVenda;
  LIntdex: Integer;
  LNumeroPedidoAux: Integer;
begin
  Result := TObjectList<TDtoPedidoVenda>.Create;
  try
    LQuery := TModelConexao.Instance.GetQuery;
    try
      LQuery.SQL.Text := GetSqlListaPedido;
      LQuery.Open;
      if LQuery.RecordCount > 0 then
      begin
        LNumeroPedidoAux := 0;
        LPedidoVenda := nil;
        while not LQuery.Eof do
        begin
          LNumeroPedidoAux := LQuery.FieldByName('numero_pedido').AsInteger;

          if (not Assigned(LPedidoVenda)) or
             (Assigned(LPedidoVenda) and (LNumeroPedidoAux <> LPedidoVenda.Numero)) then
          begin
            LIntdex := Result.Add(TDtoPedidoVenda.Create);
            LPedidoVenda := Result.Items[LIntdex];

            LPedidoVenda.Numero := LNumeroPedidoAux;
            LPedidoVenda.CodigoCliente := LQuery.FieldByName('codigo_cliente').AsInteger;
            LPedidoVenda.DsCliente := LQuery.FieldByName('nome_cliente').AsString;
            LPedidoVenda.DataEmissao := LQuery.FieldByName('data_emissao').AsDateTime;
            LPedidoVenda.ValorTotal := LQuery.FieldByName('valor_total').AsFloat;
          end;

          LIntdex := LPedidoVenda.Itens.Add(TDtoItemPedidoVenda.Create);
          LItemPedidoVenda := LPedidoVenda.Itens.Items[LIntdex];
          LItemPedidoVenda.Codigo := LQuery.FieldByName('codigo_item').AsInteger;
          LItemPedidoVenda.NumeroPedido := LQuery.FieldByName('numero_pedido').AsInteger;
          LItemPedidoVenda.CodigoProduto := LQuery.FieldByName('codigo_produto').AsInteger;
          LItemPedidoVenda.DsProduto := LQuery.FieldByName('ds_produto').AsString;
          LItemPedidoVenda.Quantidade := LQuery.FieldByName('quantidade_item').AsInteger;
          LItemPedidoVenda.ValorUnitario := LQuery.FieldByName('valor_unitario_item').AsFloat;
          LItemPedidoVenda.ValorTotal := LQuery.FieldByName('valor_total_item').AsFloat;
          LQuery.Next;
        end;
      end;
    finally
      LQuery.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TRepositoryPedidoVendaMySql.GetSqlListaPedido: String;
begin
  Result := '  select pv.numero as numero_pedido, pv.codigo_cliente, c.nome as nome_cliente, pv.data_emissao, pv.valor_total, ' +
            '         pvi.codigo as codigo_item, pvi.codigo_produto, p.Descricao as ds_produto, ' +
            '         pvi.quantidade as quantidade_item, pvi.valor_unitario as valor_unitario_item, pvi.valor_total as valor_total_item' +
            '    from pedido_venda pv ' +
            '    join cliente c ' +
            '      on c.codigo = pv.codigo_cliente ' +
            '    join pedido_venda_item pvi ' +
            '      on pvi.numero_pedido_venda = pv.numero ' +
            '    join produto p ' +
            '      on p.Codigo = pvi.codigo_produto ' +
            'order by pv.numero ';
end;

end.
