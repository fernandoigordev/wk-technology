unit Repository.Produto.Interfaces;

interface

uses
  Dto.Produto;

type
  IRepositoryProduto = interface
    ['{BA98B33B-8BA2-4F10-849F-440581E8D5C5}']
    function GetProduto(ACodigo: Integer): TDtoProduto;
  end;

implementation

end.
