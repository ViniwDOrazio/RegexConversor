unit RC.json.RulesList;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TRuleIndicator = class
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

  TRuleIndicatorList = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TRuleIndicator>;
    [GenericListReflect]
    FItems: TObjectList<TRuleIndicator>;
    function GetItems: TObjectList<TRuleIndicator>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TRuleIndicator> read GetItems;
  public
    destructor Destroy; override;
  end;

implementation

{ TRoot }

destructor TRuleIndicatorList.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TRuleIndicatorList.GetItems: TObjectList<TRuleIndicator>;
begin
  Result := ObjectList<TRuleIndicator>(FItems, FItemsArray);
end;

function TRuleIndicatorList.GetAsJson: string;
begin
  RefreshArray<TRuleIndicator>(FItems, FItemsArray);
  Result := inherited;
end;

end.
