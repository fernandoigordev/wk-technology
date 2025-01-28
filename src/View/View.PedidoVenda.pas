unit View.PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.CadastroBase, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TViewPedidoVenda = class(TViewCadastroBase)
    GroupBoxDadosPedido: TGroupBox;
    DBEdit1: TDBEdit;
    LabelCodigoPedido: TLabel;
    DBEditCodCliente: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    GroupBoxItensPedido: TGroupBox;
    PanelTopAddItem: TPanel;
    PanelAdicionarItem: TPanel;
    SpeedButtonAdicionarItem: TSpeedButton;
    DBGridItemPedido: TDBGrid;
    PanelBottomAddItem: TPanel;
    LabelTotalPedido: TLabel;
    Label4: TLabel;
  private

  protected
    function GetFilterGrid: String; override;
    function Valida: Boolean; override;

    procedure PreencheTitulo; override;
    procedure PersistirRegistro; override;
    procedure BuscarRegistros; override;
    procedure CriarCamposDataSet; override;
    procedure CriarColunasGrid; override;
  public

  end;

var
  ViewPedidoVenda: TViewPedidoVenda;

implementation

{$R *.dfm}

{ TViewPedidoVenda }

procedure TViewPedidoVenda.BuscarRegistros;
begin
  inherited;

end;

procedure TViewPedidoVenda.CriarCamposDataSet;
begin
  inherited;

end;

procedure TViewPedidoVenda.CriarColunasGrid;
begin
  inherited;

end;

function TViewPedidoVenda.GetFilterGrid: String;
begin

end;

procedure TViewPedidoVenda.PersistirRegistro;
begin
  inherited;

end;

procedure TViewPedidoVenda.PreencheTitulo;
begin
  inherited;

end;

function TViewPedidoVenda.Valida: Boolean;
begin

end;

end.
