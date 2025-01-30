unit Model.Produto.Interfaces;

interface

type
  IModelProduto = interface
    ['{B356F510-D8CF-40BC-9B7E-753603BADC7A}']
    function Codigo: Integer; overload;
    function Descricao: String; overload;
    function PrecoVenda: Double; overload;

    function Codigo(AValue: Integer): IModelProduto; overload;
    function Descricao(AValue: String): IModelProduto; overload;
    function PrecoVenda(AValue: Double): IModelProduto; overload;
  end;

implementation

end.
