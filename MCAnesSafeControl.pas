unit MCAnesSafeControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, byzMCBase, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit, Data.DB,
  OracleData, Vcl.AppEvnts, cxTextEdit, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls,
  cxMemo, cxLabel, cxGroupBox, Vcl.StdCtrls, cxButtons, dxBarBuiltInMenu, cxPC,
  cxCheckBox, cxRadioGroup, cxDBEdit, cxCheckGroup, cxDBCheckGroup, cxScrollBox,msgConst,
  byzTheBezier,DtMdGeneral,CommonConf, cxMaskEdit, cxDropDownEdit,DtMdMedCard,
  cxCheckComboBox, cxDBCheckComboBox, cxImageComboBox, Oracle;

type
  TfrmMCAnesSafeControl = class(TfrmbyzMCBase)
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxPageControl1: TcxPageControl;
    tsPageOne: TcxTabSheet;
    tsPageTwo: TcxTabSheet;
    cxScrollBox1: TcxScrollBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel9: TPanel;
    gbRiskFactor: TcxGroupBox;
    cxLabel2: TcxLabel;
    mASA_1_TEXT: TcxDBMemo;
    mASA_2_TEXT: TcxDBMemo;
    mASA_3_TEXT: TcxDBMemo;
    mASA_4_TEXT: TcxDBMemo;
    mASA_5_TEXT: TcxDBMemo;
    mASA_E_TEXT: TcxDBMemo;
    Panel10: TPanel;
    gbMallapatiClassification: TcxGroupBox;
    Panel11: TPanel;
    rgMALLAPI_CLASS: TcxDBRadioGroup;
    cxImage2: TcxImage;
    cxLabel10: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    rgALERGY: TcxDBRadioGroup;
    rgMEDICINE_USE: TcxDBRadioGroup;
    cxDBRadioGroup1: TcxDBRadioGroup;
    rgSLEEP_APNEA: TcxDBRadioGroup;
    mASPIRATION_RISK: TcxDBMemo;
    mALERGY: TcxDBMemo;
    mMEDICINE_USE: TcxDBMemo;
    mADDITIONAL_DISEASE: TcxDBMemo;
    mSLEEP_APNEA: TcxDBMemo;
    gbAbnormalExaminationFindings: TcxGroupBox;
    txtANOM_EXAM_FINDS: TcxTextEdit;
    Panel40: TPanel;
    Panel41: TPanel;
    gbAirwayExamination: TcxGroupBox;
    cxLabel42: TcxLabel;
    cxLabel43: TcxLabel;
    cxLabel44: TcxLabel;
    cxLabel45: TcxLabel;
    cxLabel46: TcxLabel;
    cxLabel47: TcxLabel;
    cxLabel48: TcxLabel;
    cxLabel49: TcxLabel;
    cxLabel50: TcxLabel;
    Panel52: TPanel;
    rbUPPER_LIP_TEST: TcxRadioButton;
    rbUPPER_LIP_TEST_2: TcxRadioButton;
    rbUPPER_LIP_TEST_3: TcxRadioButton;
    cxImage3: TcxImage;
    rgMOUTH_OPEN: TcxDBRadioGroup;
    rgSTERNOMENTAL_DISTANCE: TcxDBRadioGroup;
    rgTHYROMENTAL_DISTANCE: TcxDBRadioGroup;
    rgNECK_MOVEMENTS: TcxDBRadioGroup;
    rgRETRO_MICROGNATIA: TcxDBRadioGroup;
    rgBEARD_MUSTACHE: TcxDBRadioGroup;
    rgDENTAL_PROSTHESIS_MOBIL: TcxDBRadioGroup;
    rgEXPECTED_DIFF_AIRWAY: TcxDBRadioGroup;
    Panel53: TPanel;
    ScrollBox1: TScrollBox;
    gbAirwayEquipment: TcxGroupBox;
    cxLabel51: TcxLabel;
    cxLabel52: TcxLabel;
    cxLabel53: TcxLabel;
    cxLabel54: TcxLabel;
    cxLabel55: TcxLabel;
    cxLabel56: TcxLabel;
    cxLabel57: TcxLabel;
    cxLabel58: TcxLabel;
    cxLabel59: TcxLabel;
    cxLabel60: TcxLabel;
    cxLabel61: TcxLabel;
    cxLabel62: TcxLabel;
    cxLabel63: TcxLabel;
    cxLabel64: TcxLabel;
    cxLabel65: TcxLabel;
    cxLabel66: TcxLabel;
    cxLabel18: TcxLabel;
    rgMASK: TcxDBRadioGroup;
    rgLaryngoscope: TcxDBRadioGroup;
    rgMandrean: TcxDBRadioGroup;
    rgAirWay: TcxDBRadioGroup;
    rgSPARK_PLUG: TcxDBRadioGroup;
    cxDBRadioGroup2: TcxDBRadioGroup;
    rgBALLOON_VALVE: TcxDBRadioGroup;
    rgINJECTOR: TcxDBRadioGroup;
    rgSTABILIZER: TcxDBRadioGroup;
    rgTRACEAL_TUBE: TcxDBRadioGroup;
    rgSTILE: TcxDBRadioGroup;
    rgMAGILL: TcxDBRadioGroup;
    rgFIBER_BRONCHOSCOP: TcxDBRadioGroup;
    rgCRICOTHYROTOMY_SET: TcxDBRadioGroup;
    rgSURGICAL_AIRWAY_SET: TcxDBRadioGroup;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxmVL_EXP: TcxDBMemo;
    cxLabel67: TcxLabel;
    mDL_EXP: TcxDBMemo;
    Panel18: TPanel;
    gbEquipment: TcxGroupBox;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    cxLabel31: TcxLabel;
    cxLabel32: TcxLabel;
    cxLabel33: TcxLabel;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel37: TcxLabel;
    cxLabel38: TcxLabel;
    cxLabel39: TcxLabel;
    cxLabel40: TcxLabel;
    cxLabel41: TcxLabel;
    rgoxygencylinderfullandclosed: TcxDBRadioGroup;
    rgdrippingserums: TcxDBRadioGroup;
    rgbloodandfluidsareready: TcxDBRadioGroup;
    rgmedicinesareready: TcxDBRadioGroup;
    rgTheMonitorAlarmisOn: TcxDBRadioGroup;
    rghumidifierheatersthermometerready: TcxDBRadioGroup;
    rgvaporiserfullandinplace: TcxDBRadioGroup;
    rgDoubleBalloonTest: TcxDBRadioGroup;
    rgcolourchange: TcxDBRadioGroup;
    rgfugitive: TcxDBRadioGroup;
    rganaesthesiamachine: TcxDBRadioGroup;
    rgcircuitsize: TcxDBRadioGroup;
    rgwastesystem: TcxDBRadioGroup;
    rgemptyandactive: TcxDBRadioGroup;
    rgintravenousroute: TcxDBRadioGroup;
    rgresisutationmedicines: TcxDBRadioGroup;
    rghelperperson: TcxDBRadioGroup;
    rgsuccinylcholine: TcxDBRadioGroup;
    rgadrenaline: TcxDBRadioGroup;
    rgSlope: TcxDBRadioGroup;
    rgambu: TcxDBRadioGroup;
    cbDL: TcxDBImageComboBox;
    cbVL: TcxDBImageComboBox;
    cbSUPROGLOTTIC_AIR_DEVICE: TcxDBImageComboBox;
    rgASPIRATION_RISK: TcxDBRadioGroup;
    cbASA_1_CHECK: TcxDBCheckBox;
    cbASA_2_CHECK: TcxDBCheckBox;
    cbASA_3_CHECK: TcxDBCheckBox;
    cbASA_4_CHECK: TcxDBCheckBox;
    cbASA_5_CHECK: TcxDBCheckBox;
    cbASA_E_CHECK: TcxDBCheckBox;
    procedure btnBaseSaveClick(Sender: TObject);override;
    procedure btnBaseDeleteClick(Sender: TObject);override;
    procedure FormCreate(Sender: TObject);override;
    procedure rgASPIRATION_RISKPropertiesChange(Sender: TObject);
    procedure btnBaseAddClick(Sender: TObject);override;
    procedure cbASA_1_CHECKPropertiesChange(Sender: TObject);
    procedure cbDLPropertiesChange(Sender: TObject);


  private
    { Private declarations }
    lgvOracleDataSet1 : TOracleDataSet;
    function GetThisObject(Sender:TObject;pType:TClass):TObject;
    procedure SetRepositoryItems;
  public
    { Public declarations }
    procedure ArrangeAnesSafeControl(pOracleDataSet:TOracleDataSet);
  end;

var
  frmMCAnesSafeControl: TfrmMCAnesSafeControl;

implementation

{$R *.dfm}

procedure TfrmMCAnesSafeControl.ArrangeAnesSafeControl(pOracleDataSet: TOracleDataSet);
begin
  if pOracleDataSet = Nil then
  begin
    OracleDataSet1.SetVariable('COM_ID',FBPatientInfo.BConOfMedId);
    OracleDataSet1.Open;
    if OracleDataSet1.IsEmpty then
    begin
      OracleDataSet1.Insert;
      OracleDataSet1.FieldByName('COM_ID').AsInteger := FBPatientInfo.BConOfMedId;
      OracleDataSet1.Post;
    end
    else
    begin //byzmedcard çaðrýldýysa
      BorderStyle := bsNone;
      Align := alClient;
      BorderWidth := 10;
      lgvFrmOpenFromMedcard := True;

      lgvOracleDataSet1 := pOracleDataSet;
      gbBaseTop.Visible := True;
      pnlBaseBottom.Visible := True;
      //OracleDataSet1Det.Master := lgvOracleDataSet1;
    end;
    if OracleDataSet1Det.SQL.Text <> '' then
      OracleDataSet1Det.Open;

    OracleDataSet1Det.ReadOnly := OracleDataSet1Det.RecordCount = 0;
    btnBaseAdd.Enabled := OracleDataSet1Det.RecordCount = 0;
    SetRepositoryItems;
  end;
end;

procedure TfrmMCAnesSafeControl.SetRepositoryItems;
begin
  cbDL.RepositoryItem := dmMedCard.CreateImgCmbBox('eriDL',1310,True);
  cbVL.RepositoryItem := dmMedCard.CreateImgCmbBox('eriVL',1311,True);
  cbSUPROGLOTTIC_AIR_DEVICE.RepositoryItem := dmMedCard.CreateImgCmbBox('eriSUPROGLOTTIC_AIR_DEVICE',1312,True);
end;


procedure TfrmMCAnesSafeControl.btnBaseAddClick(Sender: TObject);
begin
  inherited;
  OracleDataSet1Det.ReadOnly := False;

  OracleDataSet1.First;
  OracleDataSet1Det.Insert;
  OracleDataSet1Det.FieldByName('PROCESS_TIME').AsDateTime := Now;
  OracleDataSet1Det.FieldByName('CTIME').AsDateTime := RealNow;
  OracleDataSet1Det.FieldByName('CUSER').AsString := UserName;
  OracleDataSet1Det.Post;
  OracleDataSet1Det.Refresh;
  btnBaseAdd.Enabled := OracleDataSet1Det.RecordCount = 0;
end;

procedure TfrmMCAnesSafeControl.btnBaseDeleteClick(Sender: TObject);
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

  OracleDataSet1Det.ReadOnly := OracleDataSet1Det.RecordCount = 0;
  btnBaseAdd.Enabled := OracleDataSet1Det.RecordCount = 0;
end;

procedure TfrmMCAnesSafeControl.btnBaseSaveClick(Sender: TObject);
begin
  inherited;
  if OracleDataSet1.State <> dsBrowse then
    OracleDataSet1.Post;
  if OracleDataSet1Det.State <> dsBrowse then
    OracleDataSet1Det.Post;

end;

procedure TfrmMCAnesSafeControl.cbASA_1_CHECKPropertiesChange(Sender: TObject);
var
  lvObject : TObject;
begin
  inherited;
  lvObject := GetThisObject(Sender,TcxDBMemo);
  if lvObject = Nil then
    Exit;
  TcxDBMemo(lvObject).Enabled := (TcxDBCheckBox(Sender).EditValue =1);
  if not TcxDBMemo(lvObject).Enabled then
    TcxDBMemo(lvObject).EditValue := Null;

end;

procedure TfrmMCAnesSafeControl.cbDLPropertiesChange(Sender: TObject);
var
  lvObject : TObject;
begin
  inherited;
  lvObject := GetThisObject(Sender,TcxDBMemo);
  if lvObject = Nil then
    Exit;
  TcxDBMemo(lvObject).Enabled := (TcxDBImageComboBox(Sender).EditValue > 0);
  if not TcxDBMemo(lvObject).Enabled then
    TcxDBMemo(lvObject).EditValue := Null;

end;

procedure TfrmMCAnesSafeControl.FormCreate(Sender: TObject);
begin
  inherited;
  btnBaseSave.Visible := true;
  btnBaseClose.Visible := true;
  btnBaseDelete.Visible := true;
  btnBasePrint.Visible := true;
end;

function TfrmMCAnesSafeControl.GetThisObject(Sender:TObject;pType:TClass):TObject;
var
  i :Integer;
begin
  Result := Nil;
  for i := 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[i].ClassType = pType then
    begin
      if (Self.Components[i].Tag = TComponent(Sender).Tag) and (Self.Components[i].Tag > 0) then
      begin
        Result := Self.Components[i];
        Break;
      end;
    end;
  end;
end;

procedure TfrmMCAnesSafeControl.rgASPIRATION_RISKPropertiesChange(
  Sender: TObject);
var
  lvObject : TObject;
begin
  inherited;
  lvObject := GetThisObject(Sender,TcxDBMemo);
  if lvObject = Nil then
    Exit;
  TcxDBMemo(lvObject).Enabled := TcxDBRadioGroup(Sender).EditValue >0;
  if Not TcxDBMemo(lvObject).Enabled then
    TcxDBMemo(lvObject).EditValue := Null;
end;

end.
