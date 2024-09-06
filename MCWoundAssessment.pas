unit MCWoundAssessment;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, byzMCBase, cxGraphics, cxLookAndFeels,Oracle,cxImageComboBox,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit, cxStyles,cxClasses,
  dxScrollbarAnnotations, cxVGrid, cxDBVGrid, cxInplaceContainer, Data.DB,CommonConf,cxDBEdit,
  OracleData, Vcl.AppEvnts, cxTextEdit, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls,dxSkinsCore,
  cxMemo, cxLabel, cxGroupBox, Vcl.StdCtrls, cxButtons,msgConst,byzTheBezier,DtMdGeneral,
  cxCheckComboBox, cxCheckBox,DtMdMedCard;
type
  TfrmMCWoundAssessment = class(TfrmbyzMCBase)
    vgWoundAssessment: TcxDBVerticalGrid;
    vgWoundAssessmentPROCESS_TIME: TcxDBEditorRow;
    vgWoundAssessmentNURSE_NAME: TcxDBEditorRow;
    vgWoundAssessmentWOUND: TcxCategoryRow;
    vgWoundAssessmentFORMATION_TIME: TcxDBMultiEditorRow;
    vgWoundAssessmentWOUND_DIMENSION: TcxDBMultiEditorRow;
    vgWoundAssessmentWOUND_LOCALIZATION: TcxDBEditorRow;
    vgWoundAssessmentPRES_SORE_AREA_ID: TcxDBEditorRow;
    vgWoundAssessmentPRES_SORE_STAGE_ID: TcxDBEditorRow;
    vgWoundAssessmentTUNNEL_SINUS: TcxDBMultiEditorRow;
    vgWoundAssessmentWOUND_BED_ID: TcxDBEditorRow;
    vgWoundAssessmentPERI_WOUND_SKIN_ID: TcxDBEditorRow;
    vgWoundAssessmentWOUND_INFECTION_ID: TcxDBEditorRow;
    vgWoundAssessmentPropertiesOfExudate: TcxCategoryRow;
    vgWoundAssessmentEXUDE_AMOUNT_ID: TcxDBEditorRow;
    vgWoundAssessmentEXUDE_TYPE_ID: TcxDBEditorRow;
    vgWoundAssessmentEXUDE_COLOR_SMELL_ID: TcxDBEditorRow;
    vgWoundAssessmentTreatmentPlan: TcxCategoryRow;
    vgWoundAssessmentPRIMARY_DRESSING_ID: TcxDBMultiEditorRow;
    vgWoundAssessmentSECONDARY_DRESSING_ID: TcxDBMultiEditorRow;
    vgWoundAssessmentDRESSING_FREQUENCY: TcxDBEditorRow;
    vgWoundAssessmentWOUND_PAIN: TcxDBEditorRow;
    vgWoundAssessmentNOTE: TcxDBEditorRow;
    vgWoundAssessmentPROCESS_TIME2: TcxDBEditorRow;
    vgWoundAssessmentTYPE_OF_WOUND_ID: TcxDBEditorRow;
    vgWoundAssessmentSUBTYPE_OF_WOUND_ID: TcxDBEditorRow;
    procedure btnBaseSaveClick(Sender: TObject);override;
    procedure btnBaseAddClick(Sender: TObject);override;
    procedure btnBaseDeleteClick(Sender: TObject);override;
    procedure FormCreate(Sender: TObject);override;
    procedure vgWoundAssessmentEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
  private
    { Private declarations }
    lgvOracleDataSet1 : TOracleDataSet;
    procedure SetRepositoryItems;
  public
    { Public declarations }
    procedure ArrangeWoundAssessment(pOracleDataSet : TOracleDataSet);
  end;
var
  frmMCWoundAssessment: TfrmMCWoundAssessment;
implementation
{$R *.dfm}

procedure TfrmMCWoundAssessment.ArrangeWoundAssessment(pOracleDataSet : TOracleDataSet);
begin
  if pOracleDataSet = nil then
  begin
    OracleDataSet1.SetVariable('COM_ID',FBPatientInfo.BConOfMedId);
    OracleDataSet1.Open;
    if OracleDataSet1.IsEmpty then
    begin
      OracleDataSet1.Insert;
      OracleDataSet1.FieldByName('COM_ID').AsInteger := FBPatientInfo.BConOfMedId;
      OracleDataSet1.Post;
    end;
  end
  else  //byzmedcard çaðrýldýysa
  begin
    BorderStyle := bsNone;
    Align := alClient;
    BorderWidth := 10;
    lgvOracleDataSet1 := pOracleDataSet;
    gbBaseTop.Visible := false;
    pnlBaseBottom.Visible := false;
    OracleDataSet1Det.ReadOnly := true;
    OracleDataSet1Det.Master := lgvOracleDataSet1;
  end;
  if OracleDataSet1Det.SQL.Text <> '' then  //sorgunun boþ olup olmadýðýný kontrol eder
    OracleDataSet1Det.Open;
  SetRepositoryItems;
  vgWoundAssessment.OptionsData.Editing := not (OracleDataSet1Det.IsEmpty);
end;

procedure TfrmMCWoundAssessment.SetRepositoryItems;
begin
  vgWoundAssessmentTYPE_OF_WOUND_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriTYPE_OF_WOUND_ID',1238);
  vgWoundAssessmentSUBTYPE_OF_WOUND_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriSUBTYPE_OF_WOUND_ID',1239);
  vgWoundAssessmentPRES_SORE_AREA_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriPRES_SORE_AREA_ID',1241);
  vgWoundAssessmentPRES_SORE_STAGE_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriPRES_SORE_STAGE_ID',1240);
  vgWoundAssessmentWOUND_BED_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriWOUND_BED_ID',1242);
  vgWoundAssessmentPERI_WOUND_SKIN_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriPERI_WOUND_SKIN_ID',1243);
  vgWoundAssessmentWOUND_INFECTION_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriWOUND_INFECTION_ID',1244);
  vgWoundAssessmentEXUDE_AMOUNT_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriEXUDE_AMOUNT_ID',1247);
  vgWoundAssessmentEXUDE_TYPE_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriEXUDE_TYPE_ID',1246);
  vgWoundAssessmentEXUDE_COLOR_SMELL_ID.Properties.RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriEXUDE_COLOR_SMELL_ID',1245);


  vgWoundAssessmentPRIMARY_DRESSING_ID.Properties.Editors.Items[0].RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriPRIMARY_DRESSING_ID',1248);
  vgWoundAssessmentSECONDARY_DRESSING_ID.Properties.Editors.Items[0].RepositoryItem
    := dmMedCard.CreateImgCmbBox('eriSECONDARY_DRESSING_ID',1249);

end;

procedure TfrmMCWoundAssessment.btnBaseAddClick(Sender: TObject);
begin
  inherited;
  if (OracleDataSet1Det.ReadOnly) and (lgvOracleDataSet1 <> nil) then
    Exit;
  vgWoundAssessment.OnFocusedRecordChanged := nil;
  OracleDataSet1Det.ReadOnly := false;
  OracleDataSet1Det.First;
  OracleDataSet1Det.Insert;
  OracleDataSet1Det.FieldByName('PROCESS_TIME').AsDateTime := Now;
  OracleDataSet1Det.FieldByName('CTIME').AsDateTime := RealNow;  //burada realnow yazýldýðýnda hata CommonConf eklendiðinde düzeliyor
  OracleDataSet1Det.FieldByName('NURSE_ID').AsInteger := UserId;
  OracleDataSet1Det.FieldByName('CUSER').AsString := UserName;
  OracleDataSet1Det.FieldByName('TYPE_OF_WOUND_ID').AsInteger := 3928;
  OracleDataSet1Det.FieldByName('SUBTYPE_OF_WOUND_ID').AsInteger := 3932;
  OracleDataSet1Det.Post;
  OracleDataSet1Det.Refresh;
  vgWoundAssessment.OptionsData.Editing := not (OracleDataSet1Det.IsEmpty);
end;

procedure TfrmMCWoundAssessment.btnBaseDeleteClick(Sender: TObject);
begin
  inherited;
  if (lgvOracleDataSet1 <> nil) then
    Exit;
  if OracleDataSet1Det.RecordCount = 0 then
    Exit;
  if not(OracleDataSet1Det.ReadOnly) then
  begin
    if MessageCustom(msgMultiUsed169) then
      OracleDataSet1Det.Delete
    else
    Exit;
  end;
  vgWoundAssessment.OptionsData.Editing := not (OracleDataSet1Det.IsEmpty);
end;

procedure TfrmMCWoundAssessment.btnBaseSaveClick(Sender: TObject);
begin
  inherited;
  if OracleDataSet1.State <> dsBrowse then
    OracleDataSet1.Post;
  if OracleDataSet1Det.State <> dsBrowse then
    OracleDataSet1Det.Post;
end;

procedure TfrmMCWoundAssessment.FormCreate(Sender: TObject);
begin
  inherited;
  btnBaseSave.Visible := True;
  btnBaseClose.Visible:= True;
  btnBaseDelete.Visible := True;
  btnBasePrint.Visible := True;
  btnBaseAdd.Visible := True;
end;

procedure TfrmMCWoundAssessment.vgWoundAssessmentEditValueChanged(
  Sender: TObject; ARowProperties: TcxCustomEditorRowProperties);
begin
  if OracleDataSet1Det.FieldByName('SUBTYPE_OF_WOUND_ID').AsInteger = 3932 then //  yaranýn alt türü 3932 ise Basý Yaralarý
  begin
  //kullanýcý tarafýndan düzenlenebilir olarak ayarlama
    vgWoundAssessmentPRES_SORE_AREA_ID.Properties.Options.Editing := true;
    vgWoundAssessmentPRES_SORE_STAGE_ID.Properties.Options.Editing := true;
  end
  else
  begin
  //yaranýn alt türü 3932'ye eþit deðilse kullanýcý tarafýndan düzenlenemeyecek þekilde ayarlama
    vgWoundAssessmentPRES_SORE_AREA_ID.Properties.Options.Editing := false;
    vgWoundAssessmentPRES_SORE_STAGE_ID.Properties.Options.Editing := false;
  //kullanýcý arayüzünde boþ deðerler gösterilmesi ve verilerin temizlenmesi için
    vgWoundAssessmentPRES_SORE_AREA_ID.Properties.DataBinding.Field.Value := null;
    vgWoundAssessmentPRES_SORE_STAGE_ID.Properties.DataBinding.Field.Value := null;
  end;

  if (ARowProperties.ItemIndex in [9,10,11]) then
  begin
    if (OracleDataSet1Det.FieldByName('WOUND_LENGTH').AsInteger > 0) and
        (OracleDataSet1Det.FieldByName('WOUND_WIDTH').AsInteger > 0) and
        (OracleDataSet1Det.FieldByName('WOUND_DEPTH').AsInteger > 0) then
    begin
      if OracleDataSet1Det.State = dsBrowse then
        OracleDataSet1Det.Edit;

      OracleDataSet1Det.FieldByName('WOUND_AREA').AsInteger :=
        OracleDataSet1Det.FieldByName('WOUND_LENGTH').AsInteger *
        OracleDataSet1Det.FieldByName('WOUND_WIDTH').AsInteger *
        OracleDataSet1Det.FieldByName('WOUND_DEPTH').AsInteger;
      OracleDataSet1Det.Post;
    end
    else
      if OracleDataSet1Det.FieldByName('WOUND_AREA').AsInteger > 0 then
      begin
        if OracleDataSet1Det.State = dsBrowse then
          OracleDataSet1Det.Edit;
        OracleDataSet1Det.FieldByName('WOUND_AREA').AsVariant := null;
        OracleDataSet1Det.Post;
      end;
  end;
end;

end.
