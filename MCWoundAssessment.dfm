inherited frmMCWoundAssessment: TfrmMCWoundAssessment
  Caption = 'Yara De'#287'erlendirme Formu'
  ClientHeight = 755
  ClientWidth = 913
  ExplicitWidth = 925
  ExplicitHeight = 793
  TextHeight = 13
  inherited pnlBaseBottom: TPanel
    Width = 913
    ExplicitWidth = 907
    inherited btnBaseClose: TcxButton
      Left = 834
      ExplicitLeft = 828
    end
  end
  inherited pnlMain: TPanel
    Width = 913
    Height = 643
    ExplicitWidth = 907
    ExplicitHeight = 634
    object vgWoundAssessment: TcxDBVerticalGrid
      Left = 0
      Top = 0
      Width = 913
      Height = 643
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      Align = alClient
      LayoutStyle = lsMultiRecordView
      OptionsView.RowHeaderWidth = 214
      OptionsView.ValueWidth = 120
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      TabOrder = 0
      OnEditValueChanged = vgWoundAssessmentEditValueChanged
      DataController.DataSource = DataSource2
      ExplicitWidth = 907
      ExplicitHeight = 634
      Version = 1
      object vgWoundAssessmentPROCESS_TIME: TcxDBEditorRow
        Properties.Caption = 'Tarih'
        Properties.RepositoryItem = dmGeneral.eriStandardsDateItemDATE
        Properties.DataBinding.FieldName = 'PROCESS_TIME'
        ID = 0
        ParentID = -1
        Index = 0
        Version = 1
      end
      object vgWoundAssessmentPROCESS_TIME2: TcxDBEditorRow
        Properties.Caption = 'Saat'
        Properties.RepositoryItem = dmGeneral.eriStandardsTimeItemHM
        Properties.DataBinding.FieldName = 'PROCESS_TIME'
        ID = 1
        ParentID = -1
        Index = 1
        Version = 1
      end
      object vgWoundAssessmentNURSE_NAME: TcxDBEditorRow
        Properties.Caption = 'Hem'#351'ire'
        Properties.DataBinding.FieldName = 'NURSE_NAME'
        ID = 2
        ParentID = -1
        Index = 2
        Version = 1
      end
      object vgWoundAssessmentWOUND: TcxCategoryRow
        Properties.Caption = 'Yara'
        ID = 3
        ParentID = -1
        Index = 3
        Version = 1
      end
      object vgWoundAssessmentBEFORE_INPATIENT: TcxDBEditorRow
        Properties.Caption = 'Yat'#305#351' '#214'ncesi'
        Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
        Properties.RepositoryItem = dmGeneral.eriStandardsCheckBoxItem01
        Properties.DataBinding.FieldName = 'BEFORE_INPATIENT'
        ID = 4
        ParentID = 3
        Index = 0
        Version = 1
      end
      object vgWoundAssessmentTYPE_OF_WOUND_ID: TcxDBEditorRow
        Properties.Caption = 'T'#252'r'#252
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'TYPE_OF_WOUND_ID'
        ID = 5
        ParentID = 3
        Index = 1
        Version = 1
      end
      object vgWoundAssessmentSUBTYPE_OF_WOUND_ID: TcxDBEditorRow
        Properties.Caption = 'Alt T'#252'r'#252
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'SUBTYPE_OF_WOUND_ID'
        ID = 6
        ParentID = 3
        Index = 2
        Version = 1
      end
      object vgWoundAssessmentFORMATION_TIME: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'Olu'#351' S'#252'resi - Y'#305'l'
            HeaderAlignmentHorz = taCenter
            Width = 80
            DataBinding.FieldName = 'FORMATION_TIME_YEAR'
          end
          item
            Caption = 'Ay'
            HeaderAlignmentHorz = taCenter
            DataBinding.FieldName = 'FORMATION_TIME_MONTH'
          end
          item
            Caption = 'G'#252'n'
            HeaderAlignmentHorz = taCenter
            DataBinding.FieldName = 'FORMATION_TIME_DAY'
          end>
        ID = 7
        ParentID = 3
        Index = 3
        Version = 1
      end
      object vgWoundAssessmentWOUND_DIMENSION: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'Boyu'
            RepositoryItem = dmGeneral.eriStandardsSpinItemQuantity
            DataBinding.FieldName = 'WOUND_LENGTH'
          end
          item
            Caption = 'Eni'
            RepositoryItem = dmGeneral.eriStandardsSpinItemQuantity
            DataBinding.FieldName = 'WOUND_WIDTH'
          end
          item
            Caption = 'Derinlik'
            RepositoryItem = dmGeneral.eriStandardsSpinItemQuantity
            DataBinding.FieldName = 'WOUND_DEPTH'
          end
          item
            Caption = 'Alan'
            DataBinding.FieldName = 'WOUND_AREA'
          end>
        ID = 8
        ParentID = 3
        Index = 4
        Version = 1
      end
      object vgWoundAssessmentWOUND_LOCALIZATION: TcxDBEditorRow
        Properties.Caption = 'B'#246'lgesi'
        Properties.DataBinding.FieldName = 'WOUND_LOCALIZATION'
        ID = 9
        ParentID = 3
        Index = 5
        Version = 1
      end
      object vgWoundAssessmentPRES_SORE_AREA_ID: TcxDBEditorRow
        Properties.Caption = 'Bas'#305' Yaras'#305' B'#246'lgesi'
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'PRES_SORE_AREA_ID'
        ID = 10
        ParentID = 3
        Index = 6
        Version = 1
      end
      object vgWoundAssessmentPRES_SORE_STAGE_ID: TcxDBEditorRow
        Properties.Caption = 'Bas'#305' Yaras'#305' Evresi'
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'PRES_SORE_STAGE_ID'
        ID = 11
        ParentID = 3
        Index = 7
        Version = 1
      end
      object vgWoundAssessmentTUNNEL_SINUS: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'T'#252'nel/Sin'#252's Var?'
            EditPropertiesClassName = 'TcxCheckBoxProperties'
            RepositoryItem = dmGeneral.eriStandardsCheckBoxItem01
            DataBinding.FieldName = 'IS_TUNNEL_OR_SINUS'
          end
          item
            Caption = 'Derinli'#287'i'
            DataBinding.FieldName = 'TUNNEL_OR_SINUS_DEPTH'
          end>
        ID = 12
        ParentID = 3
        Index = 8
        Version = 1
      end
      object vgWoundAssessmentWOUND_BED_ID: TcxDBEditorRow
        Properties.Caption = 'Yara Yata'#287#305
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'WOUND_BED_ID'
        ID = 13
        ParentID = -1
        Index = 4
        Version = 1
      end
      object vgWoundAssessmentPERI_WOUND_SKIN_ID: TcxDBEditorRow
        Properties.Caption = 'Yara Etraf'#305'ndaki Cilt '
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'PERI_WOUND_SKIN_ID'
        ID = 14
        ParentID = -1
        Index = 5
        Version = 1
      end
      object vgWoundAssessmentWOUND_INFECTION_ID: TcxDBEditorRow
        Properties.Caption = 'Enfeksiyon'
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'WOUND_INFECTION_ID'
        ID = 15
        ParentID = -1
        Index = 6
        Version = 1
      end
      object vgWoundAssessmentPropertiesOfExudate: TcxCategoryRow
        Properties.Caption = 'Eksudan'#305'n '#214'zellikleri'
        ID = 16
        ParentID = -1
        Index = 7
        Version = 1
      end
      object vgWoundAssessmentEXUDE_AMOUNT_ID: TcxDBEditorRow
        Properties.Caption = 'Miktar'#305
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'EXUDE_AMOUNT_ID'
        ID = 17
        ParentID = 16
        Index = 0
        Version = 1
      end
      object vgWoundAssessmentEXUDE_TYPE_ID: TcxDBEditorRow
        Properties.Caption = 'Tipi'
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'EXUDE_TYPE_ID'
        ID = 18
        ParentID = 16
        Index = 1
        Version = 1
      end
      object vgWoundAssessmentEXUDE_COLOR_SMELL_ID: TcxDBEditorRow
        Properties.Caption = 'Rengi/Kokusu'
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.DataBinding.FieldName = 'EXUDE_COLOR_SMELL_ID'
        ID = 19
        ParentID = 16
        Index = 2
        Version = 1
      end
      object vgWoundAssessmentTreatmentPlan: TcxCategoryRow
        Properties.Caption = 'Tedavi Plan'#305
        ID = 20
        ParentID = -1
        Index = 8
        Version = 1
      end
      object vgWoundAssessmentPRIMARY_DRESSING_ID: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'Primer Pansuman'
            EditPropertiesClassName = 'TcxImageComboBoxProperties'
            EditProperties.Items = <>
            DataBinding.FieldName = 'PRIMARY_DRESSING_ID'
          end
          item
            Caption = 'Di'#287'er'
            DataBinding.FieldName = 'PRIMARY_DRESSING_OTHER'
          end>
        ID = 21
        ParentID = 20
        Index = 0
        Version = 1
      end
      object vgWoundAssessmentSECONDARY_DRESSING_ID: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'Sekonder Pansuman'
            EditPropertiesClassName = 'TcxImageComboBoxProperties'
            EditProperties.Items = <>
            DataBinding.FieldName = 'SECONDARY_DRESSING_ID'
          end
          item
            Caption = 'Di'#287'er'
            DataBinding.FieldName = 'SECONDERY_DRESSING_OTHER'
          end>
        ID = 22
        ParentID = 20
        Index = 1
        Version = 1
      end
      object vgWoundAssessmentDRESSING_FREQUENCY: TcxDBEditorRow
        Properties.Caption = 'Pansuman S'#305'kl'#305#287#305
        Properties.DataBinding.FieldName = 'DRESSING_FREQUENCY'
        ID = 23
        ParentID = 20
        Index = 2
        Version = 1
      end
      object vgWoundAssessmentWOUND_PAIN: TcxDBEditorRow
        Properties.Caption = 'Yara '#304'le '#304'li'#351'kili A'#287'r'#305'n'#305'n '#350'iddeti'
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.Items = <>
        Properties.RepositoryItem = dmGeneral.eriICBWoudnPains
        Properties.DataBinding.FieldName = 'WOUND_PAIN'
        ID = 24
        ParentID = 20
        Index = 3
        Version = 1
      end
      object vgWoundAssessmentNOTE: TcxDBEditorRow
        Properties.Caption = 'Not'
        Properties.DataBinding.FieldName = 'NOTE'
        ID = 25
        ParentID = -1
        Index = 9
        Version = 1
      end
    end
  end
  inherited gbBaseTop: TcxGroupBox
    ExplicitWidth = 907
    Width = 913
    inherited pnlGenLeft: TPanel
      inherited pnlPatientDetail: TPanel
        inherited Panel7: TPanel
          inherited cxLabel6: TcxLabel
            AnchorY = 8
          end
          inherited lblDoctor: TcxLabel
            AnchorY = 25
          end
        end
        inherited Panel8: TPanel
          inherited lblAssCaption: TcxLabel
            AnchorY = 8
          end
          inherited lblAss: TcxLabel
            AnchorY = 25
          end
        end
        inherited pnlIsPregnant: TPanel
          inherited cxLabel7: TcxLabel
            AnchorY = 8
          end
        end
        inherited Panel17: TPanel
          inherited cxLabel12: TcxLabel
            AnchorY = 8
          end
          inherited lblSecAss: TcxLabel
            AnchorY = 25
          end
        end
        inherited Panel1: TPanel
          inherited lblLength: TcxLabel
            AnchorY = 35
          end
        end
        inherited Panel2: TPanel
          inherited lblWeight: TcxLabel
            AnchorY = 35
          end
        end
        inherited Panel3: TPanel
          inherited cxLabel13: TcxLabel
            AnchorY = 8
          end
          inherited teUPN: TcxTextEdit
            ExplicitHeight = 20
          end
        end
      end
      inherited pnlPatientInfo: TPanel
        inherited lblPatName: TcxLabel
          AnchorX = 124
          AnchorY = 18
        end
        inherited pnlProt: TPanel
          inherited cxLabel1: TcxLabel
            AnchorY = 8
          end
          inherited teProt: TcxTextEdit
            ExplicitHeight = 20
          end
        end
        inherited pnlPatInfoAge: TPanel
          inherited lblAge: TcxLabel
            AnchorY = 35
          end
        end
        inherited pnlPatInfoBirthDate: TPanel
          inherited lblBirth: TcxLabel
            AnchorY = 35
          end
        end
        inherited pnlPatInfoSexuality: TPanel
          inherited lblGender: TcxLabel
            AnchorY = 35
          end
        end
      end
    end
  end
  inherited AppEvntsBase: TApplicationEvents
    Left = 632
    Top = 128
  end
  inherited OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT WA.*,WA.ROWID'
      'FROM MC_WOUND_ASSESS WA'
      'WHERE WA.COM_ID =: COM_ID')
    Variables.Data = {
      04000000010000000E0000003A0043004F004D005F0049004400030000000000
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'MC_WOUND_ASSES_ID_SEQ'
    SequenceField.ApplyMoment = amOnNewRecord
    Left = 552
    Top = 288
  end
  inherited DataSource1: TDataSource
    Left = 552
    Top = 368
  end
  inherited OracleDataSet1Det: TOracleDataSet
    SQL.Strings = (
      'SELECT WAD.*,WAD.ROWID,'
      '       SUBSTR(GET_USER_NAME(WAD.NURSE_ID),1,50) AS NURSE_NAME'
      'FROM MC_WOUND_ASSESS_DET WAD'
      'WHERE WAD.WA_ID =: WA_ID'
      'ORDER BY CTIME DESC')
    Variables.Data = {
      04000000010000000C0000003A00570041005F00490044000300000000000000
      00000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'MC_WOUND_ASSES_DET_ID_SEQ'
    SequenceField.ApplyMoment = amOnNewRecord
    DetailFields = 'WA_ID'
    Left = 696
    Top = 280
  end
  inherited DataSource2: TDataSource
    Left = 696
    Top = 360
  end
end
