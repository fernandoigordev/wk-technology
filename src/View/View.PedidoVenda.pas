unit View.PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.CadastroBase, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Controller.PedidoVenda;

type
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
    ClientDataSetItens: TClientDataSet;
    DataSourceItens: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FControllerPedidoVenda: TControllerPedidoVenda;
    function ValidaCliente: Boolean;
    function ValidaDataEmissao: Boolean;
    function ValidaItensPedido: Boolean;

  protected
    function GetFilterGrid: String; override;
    function Valida: Boolean; override;

    procedure PreencheTitulo; override;
    procedure PersistirRegistro; override;
    procedure BuscarRegistros; override;
    procedure PersistirExclusao; override;
  public

  end;

var
  ViewPedidoVenda: TViewPedidoVenda;

implementation

uses
  System.UITypes,
  Repository.PedidoVenda.MySql;

{$R *.dfm}

{ TViewPedidoVenda }

procedure TViewPedidoVenda.BuscarRegistros;
begin
  inherited;

end;

procedure TViewPedidoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FControllerPedidoVenda.Free;
end;

procedure TViewPedidoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  FControllerPedidoVenda := TControllerPedidoVenda.Create(TRepositoryPedidoVendaMySql.Create, ClientDataSetCadastro, ClientDataSetItens);
  FControllerPedidoVenda.PopularPedidosVenda;
end;

function TViewPedidoVenda.GetFilterGrid: String;
begin
  Result := EmptyStr;
  if EditFiltroGrid.Text <> EmptyStr then
    Result := Concat('Upper(DsCliente) like ', QuotedStr(Concat('%', UpperCase(EditFiltroGrid.Text), '%')));
end;

procedure TViewPedidoVenda.PersistirExclusao;
begin
  inherited;

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
