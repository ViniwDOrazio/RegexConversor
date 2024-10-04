unit RC.json.RulesList;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TItems = class
  private
    [JSONName('description')]
    FDescription: string;
    [JSONName('name')]
    FName: string;
    [JSONName('rule')]
    FRule: string;
  published
    property Description: string read FDescription write FDescription;
    property Name: string read FName write FName;
    property Rule: string read FRule write FRule;
  end;

  TRoot = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TItems>;
    [GenericListReflect]
    FItems: TObjectList<TItems>;
    function GetItems: TObjectList<TItems>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TItems> read GetItems;
  public
    destructor Destroy; override;
  end;

implementation

{ TRoot }

destructor TRoot.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TRoot.GetItems: TObjectList<TItems>;
begin
  Result := ObjectList<TItems>(FItems, FItemsArray);
end;

function TRoot.GetAsJson: string;
begin
  RefreshArray<TItems>(FItems, FItemsArray);
  Result := inherited;
end;

end.
