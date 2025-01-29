unit View.PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.CadastroBase, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TValidaPedidoVenda = (vpvTodos, vpvCliente, vpvDataEmissao, vpvItensPedido);

  TViewPedidoVenda = class(TViewCadastroBase)
    GroupBoxDadosPedido: TGroupBox;
    DBEdit1: TDBEdit;
    LabelCodigoPedido: TLabel;
    DBEditCodCliente: TDBEdit;
    Label2: TLabel;
    DBEditDsCliente: TDBEdit;
    Label3: TLabel;
    DBEditDataEmissao: TDBEdit;
    GroupBoxItensPedido: TGroupBox;
    PanelTopAddItem: TPanel;
    PanelAdicionarItem: TPanel;
    SpeedButtonAdicionarItem: TSpeedButton;
    DBGridItemPedido: TDBGrid;
    PanelBottomAddItem: TPanel;
    LabelTotalPedido: TLabel;
    Label4: TLabel;
    ClientDataSetCadastroNumeroPedido: TIntegerField;
    ClientDataSetCadastroCodigoCliente: TIntegerField;
    ClientDataSetCadastroDsCliente: TStringField;
    ClientDataSetCadastroDataEmissao: TDateField;
    ClientDataSetCadastroValorTotal: TFloatField;
    ClientDataSetItens: TClientDataSet;
    DataSourceItens: TDataSource;
    ClientDataSetItensId: TIntegerField;
    ClientDataSetItensNumeroPedido: TIntegerField;
    ClientDataSetItensCodigoProduto: TIntegerField;
    ClientDataSetItensQuantidade: TIntegerField;
    ClientDataSetItensValorUnitario: TFloatField;
    ClientDataSetItensValorTotal: TFloatField;
    ClientDataSetItensDsProduto: TStringField;
  private
    function ValidaCliente: Boolean;
    function ValidaDataEmissao: Boolean;
    function ValidaItensPedido: Boolean;

  protected
    function GetFilterGrid: String; override;
    function Valida: Boolean; override;

    procedure PreencheTitulo; override;
    procedure PersistirRegistro; override;
    procedure BuscarRegistros; override;
  public

  end;

var
  ViewPedidoVenda: TViewPedidoVenda;

implementation

uses
  System.UITypes;

{$R *.dfm}

{ TViewPedidoVenda }

procedure TViewPedidoVenda.BuscarRegistros;
begin
  inherited;

end;

function TViewPedidoVenda.GetFilterGrid: String;
begin
  Result := EmptyStr;
  if EditFiltroGrid.Text <> EmptyStr then
    Result := Concat('Upper(DsCliente) like ', QuotedStr(Concat('%', UpperCase(EditFiltroGrid.Text), '%')));
end;

procedure TViewPedidoVenda.PersistirRegistro;
begin
  inherited;

end;

procedure TViewPedidoVenda.PreencheTitulo;
begin
  LabelTitulo.Caption := 'Pedido de venda';
end;

function TViewPedidoVenda.Valida: Boolean;
begin
  Result := (ValidaCliente and ValidaDataEmissao and ValidaItensPedido);
end;

function TViewPedidoVenda.ValidaCliente: Boolean;
begin
  Result := True;
  if DBEditDsCliente.Text = EmptyStr then
  begin
    Result := False;
    MessageDlg('Cliente inválido!', mtWarning, [mbOK], 0);
    DBEditCodCliente.SetFocus;
  end;
end;

function TViewPedidoVenda.ValidaDataEmissao: Boolean;
begin
  Result := True;
  if StrToDateDef(DBEditDataEmissao.Text, 0) = 0 then
  begin
    Result := False;
    MessageDlg('Data de emissão inválida!', mtWarning, [mbOK], 0);
    DBEditDataEmissao.SetFocus;
  end;
end;

function TViewPedidoVenda.ValidaItensPedido: Boolean;
begin
  Result := True;

end;

end.
