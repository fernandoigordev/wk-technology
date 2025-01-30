program WkTechnology;

uses
  Vcl.Forms,
  View.CadastroBase in 'src\View\View.CadastroBase.pas' {ViewCadastroBase},
  View.PedidoVenda in 'src\View\View.PedidoVenda.pas' {ViewPedidoVenda},
  Controller.PedidoVenda in 'src\Controller\Controller.PedidoVenda.pas',
  Model.PedidoVenda.Interfaces in 'src\Model\PedidoVenda\Model.PedidoVenda.Interfaces.pas',
  Model.ItemPedidoVenda.Interfaces in 'src\Model\ItemPedidoVenda\Model.ItemPedidoVenda.Interfaces.pas',
  Dto.PedidoVenda in 'src\Dto\Dto.PedidoVenda.pas',
  Dto.ItemPedidoVenda in 'src\Dto\Dto.ItemPedidoVenda.pas',
  Model.PedidoVenda in 'src\Model\PedidoVenda\Model.PedidoVenda.pas',
  Model.ItemPedidoVenda in 'src\Model\ItemPedidoVenda\Model.ItemPedidoVenda.pas',
  Repository.PedidoVenda.Interfaces in 'src\Repository\Repository.PedidoVenda.Interfaces.pas',
  Repository.PedidoVenda.MySql in 'src\Repository\Repository.PedidoVenda.MySql.pas',
  Model.Conexao in 'src\Model\Conexao\Model.Conexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPedidoVenda, ViewPedidoVenda);
  Application.Run;
end.
