program WkTechnology;

uses
  Vcl.Forms,
  View.CadastroBase in 'src\View\View.CadastroBase.pas' {ViewCadastroBase},
  View.PedidoVenda in 'src\View\View.PedidoVenda.pas' {ViewPedidoVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPedidoVenda, ViewPedidoVenda);
  Application.Run;
end.
