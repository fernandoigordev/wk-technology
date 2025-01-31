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
  Repository.PedidoVenda.Interfaces in 'src\Repository\PedidoVenda\Repository.PedidoVenda.Interfaces.pas',
  Repository.PedidoVenda.MySql in 'src\Repository\PedidoVenda\Repository.PedidoVenda.MySql.pas',
  Model.Conexao in 'src\Model\Conexao\Model.Conexao.pas',
  Repository.Cliente.Interfaces in 'src\Repository\Cliente\Repository.Cliente.Interfaces.pas',
  Repository.Cliente.MySql in 'src\Repository\Cliente\Repository.Cliente.MySql.pas',
  Model.Cliente.Interfaces in 'src\Model\Cliente\Model.Cliente.Interfaces.pas',
  Model.Cliente in 'src\Model\Cliente\Model.Cliente.pas',
  Dto.Cliente in 'src\Dto\Dto.Cliente.pas',
  Controller.Cliente in 'src\Controller\Controller.Cliente.pas',
  View.PedidoVendaItem in 'src\View\View.PedidoVendaItem.pas' {ViewPedidoVendaItem},
  Repository.Produto.Interfaces in 'src\Repository\Produto\Repository.Produto.Interfaces.pas',
  Dto.Produto in 'src\Dto\Dto.Produto.pas',
  Repository.Produto.MySql in 'src\Repository\Produto\Repository.Produto.MySql.pas',
  Model.Produto.Interfaces in 'src\Model\Produto\Model.Produto.Interfaces.pas',
  Model.Produto in 'src\Model\Produto\Model.Produto.pas',
  Controller.Produto in 'src\Controller\Controller.Produto.pas',
  Repository.PedidoVendaItem.Interfaces in 'src\Repository\PedidoVendaItem\Repository.PedidoVendaItem.Interfaces.pas',
  Repository.PedidoVendaItem.MySql in 'src\Repository\PedidoVendaItem\Repository.PedidoVendaItem.MySql.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPedidoVenda, ViewPedidoVenda);
  Application.Run;
end.
