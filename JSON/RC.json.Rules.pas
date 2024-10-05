unit RC.json.Rules;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TApplyRules = class;
  TCaseConversionOptions = class;

  TCaseConversionOptions = class
  private
    [JSONName('option')]
    FOption: string;
  published
    property Option: string read FOption write FOption;
  end;

  TApplyRules = class
  private
    [JSONName('name')]
    FName: string;
  published
    property Name: string read FName write FName;
  end;

  TRule = class(TJsonDTO)
  private
    [JSONName('apply-rules'), JSONMarshalled(False)]
    FApplyRulesArray: TArray<TApplyRules>;
    [GenericListReflect]
    FApplyRules: TObjectList<TApplyRules>;
    [JSONName('args-tratament'), JSONMarshalled(False)]
    FArgsTratamentArray: TArray<TRule>;
    [GenericListReflect]
    FArgsTratament: TObjectList<TRule>;
    [JSONName('case-conversion-on-replace')]
    FCaseConversionOnReplace: Boolean;
    [JSONName('case-conversion-options'), JSONMarshalled(False)]
    FCaseConversionOptionsArray: TArray<TCaseConversionOptions>;
    [GenericListReflect]
    FCaseConversionOptions: TObjectList<TCaseConversionOptions>;
    [JSONName('default-case-conversion')]
    FDefaultCaseConversion: string;
    [JSONName('find')]
    FFind: string;
    [JSONName('index')]
    FIndex: Integer;
    [JSONName('name')]
    FName: string;
    [JSONName('replace')]
    FReplace: string;
    [JSONName('space_size')]
    FSpaceSize: Integer;
    [JSONName('write-as-is')]
    FWriteAsIs: Boolean;
    function GetApplyRules: TObjectList<TApplyRules>;
    function GetArgsTratament: TObjectList<TRule>;
    function GetCaseConversionOptions: TObjectList<TCaseConversionOptions>;
  protected
    function GetAsJson: string; override;
  published
    property ApplyRules: TObjectList<TApplyRules> read GetApplyRules;
    property ArgsTratament: TObjectList<TRule> read GetArgsTratament;
    property CaseConversionOnReplace: Boolean read FCaseConversionOnReplace write FCaseConversionOnReplace;
    property CaseConversionOptions: TObjectList<TCaseConversionOptions> read GetCaseConversionOptions;
    property DefaultCaseConversion: string read FDefaultCaseConversion write FDefaultCaseConversion;
    property Find: string read FFind write FFind;
    property Index: Integer read FIndex write FIndex;
    property Name: string read FName write FName;
    property Replace: string read FReplace write FReplace;
    property SpaceSize: Integer read FSpaceSize write FSpaceSize;
    property WriteAsIs: Boolean read FWriteAsIs write FWriteAsIs;
  public
    destructor Destroy; override;
  end;

  TRulesContent = class(TJsonDTO)
  private
    [JSONName('rules'), JSONMarshalled(False)]
    FRulesArray: TArray<TRule>;
    [GenericListReflect]
    FRules: TObjectList<TRule>;
    function GetRules: TObjectList<TRule>;
  protected
    function GetAsJson: string; override;
  published
    property Rules: TObjectList<TRule> read GetRules;
  public
    destructor Destroy; override;
  end;

implementation

{ TRules }

destructor TRule.Destroy;
begin
  GetApplyRules.Free;
  GetCaseConversionOptions.Free;
  GetArgsTratament.Free;
  inherited;
end;

function TRule.GetApplyRules: TObjectList<TApplyRules>;
begin
  Result := ObjectList<TApplyRules>(FApplyRules, FApplyRulesArray);
end;

function TRule.GetArgsTratament: TObjectList<TRule>;
begin
  Result := ObjectList<TRule>(FArgsTratament, FArgsTratamentArray);
end;

function TRule.GetCaseConversionOptions: TObjectList<TCaseConversionOptions>;
begin
  Result := ObjectList<TCaseConversionOptions>(FCaseConversionOptions, FCaseConversionOptionsArray);
end;

function TRule.GetAsJson: string;
begin
  RefreshArray<TApplyRules>(FApplyRules, FApplyRulesArray);
  RefreshArray<TRule>(FArgsTratament, FArgsTratamentArray);
  RefreshArray<TCaseConversionOptions>(FCaseConversionOptions, FCaseConversionOptionsArray);
  Result := inherited;
end;

{ TRoot }

destructor TRulesContent.Destroy;
begin
  GetRules.Free;
  inherited;
end;

function TRulesContent.GetRules: TObjectList<TRule>;
begin
  Result := ObjectList<TRule>(FRules, FRulesArray);
end;

function TRulesContent.GetAsJson: string;
begin
  RefreshArray<TRule>(FRules, FRulesArray);
  Result := inherited;
end;

end.
