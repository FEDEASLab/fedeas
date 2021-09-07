%% 1. Step: copy functions from FEDEASLab folders to a destination folder for NLABasic Version

% specify base directory
Base_Directory = 'c:\Drive D\fedeas\FEDEASLab';

% create destination directories for NLABasic FEDEASLab version
mkdir(Base_Directory,'NLABasic');
mkdir(Base_Directory,'NLABasic\General_Functions');
mkdir(Base_Directory,'NLABasic\Analysis_Functions');
mkdir(Base_Directory,'NLABasic\Analysis_Functions\Static');
mkdir(Base_Directory,'NLABasic\Analysis_Functions\Dynamic');
mkdir(Base_Directory,'NLABasic\Solution_Scripts');
mkdir(Base_Directory,'NLABasic\Element_Library');
mkdir(Base_Directory,'NLABasic\Section_Library');
mkdir(Base_Directory,'NLABasic\Material_Library');
%
mkdir(Base_Directory,'NLABasic\Utility_Functions');
mkdir(Base_Directory,'NLABasic\Utility_Functions\General');
mkdir(Base_Directory,'NLABasic\Utility_Functions\Plotting');
mkdir(Base_Directory,'NLABasic\Utility_Functions\PreProcessing');
mkdir(Base_Directory,'NLABasic\Utility_Functions\PostProcessing');
mkdir(Base_Directory,'NLABasic\Utility_Functions\Interpolation');
mkdir(Base_Directory,'NLABasic\Utility_Functions\Quadrature');

% ------------------------------------------------------------------------------------------
%% 1rst folder
% the following files reside in the folder General
%                     and go to the folder NLABasic\General_Functions

% functions of Basic Version
FileNames = { 'A_matrix.m' ;
              'B_matrix.m' ;
              'BbariBbarx_matrix.m' ;
              'Create_NodalForces.m' ;
              'Create_PwForces.m' ;
              'Create_SimpleModel.m' ;
              'Fs_matrix.m' ;
              'Ks_matrix.m' ;
              'Localize.m' ;
              'Q0_vector.m' ;
              'V0_vector.m' };
% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'Add_Damping2State.m' ;
                'Add_Mass2Model.m' ;
                'Aj_matrix.m' ;
                'Condense_MV.m' ;
                'Create_Damping.m' ;
                'Create_Loading.m' ;
                'Create_Model.m' ;
                'Create_NodalMass.m' ;
                'Extract_Str2ElState.m' ;
                'Structure.m' ;
                'SubIncr4ElemntSD.m' }
            ];

Source_Directory = [ Base_Directory '\General' ];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\General_Functions' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end


% ------------------------------------------------------------------------------------------
%% 2nd folder
% the following files reside in the folder Solution_Library
%                     and go to the folder NLABasic\Analysis_Functions\Static

% functions of Basic Version
FileNames = { 'PlasticAnalysis_wLBT.m' ;
              'PlasticAnalysis_wUBT.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'Event2Event_NLAnalysis.m' ;
                'Increment.m' ;
                'Initialize.m' ;
                'Initialize_SolStrat.m' ;
                'Initialize_State.m' ;
                'Iterate.m' ;
                'LinearStep.m' ;
                'LoadFactorControl.m' ;
                'LoadFactorIncrement.m' ;
                'OneIteration.m' ;
                'PlasticAnalysis.m' ;
                'StateDetermination.m' ;
                'Update_State.m'}
            ];
            
Source_Directory = [ Base_Directory '\Solution_Library' ];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Analysis_Functions\Static' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 3rd folder
% the following files reside in the folder Solution_Library
%                     and go to the folder NLABasic\Analysis_Functions\Dynamic

% functions for NLABasic Version
FileNames = { 'OneTransientIteration.m' ;
              'TimeIntegrationConstants.m' ;
              'TransientIncrement.m' ;
              'TransientInitialize.m' ;
              'TransientIterate.m' ;
              'TransientStateDetermination.m' ;
              'Update_TransientState.m' };

Source_Directory = [Base_Directory '\Solution_Library'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Analysis_Functions\Dynamic' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 4th folder
% the following files reside in the folder Dynamics
%                     and go to the folder NLABasic\Analysis_Functions\Dynamic

% functions for NLABasic Version
FileNames = { 'AccelerationIntegral.m' ;
              'EigenMode.m' ;
              'ElasticResponseSpectrum.m' ;
              'InelSDOF_Newmark.m' ;
              'LSDOF_CentralDifference.m'
              'LSDOF_LinearWilson.m' ;
              'LSDOF_Newmark.m' ;
              'ModalAnalysis.m' ;
              'ModeDecomposition.m' };

Source_Directory = [Base_Directory '\Dynamics'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Analysis_Functions\Dynamic' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 5th folder
% the following files reside in folder Solution_Library\Scripts
%                     and go to folder NLABasic\Solution_Scripts

% functions of Basic Version
FileNames = { 'S_Check_Global3dEQ.m' ;
              'S_DisplMethod.m' ;
              'S_ForceMethod.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'S_MomCurvAnalysis.m' ;
                'S_NMAnalysis.m' ;
                'S_NMAnalysiswSepLoadHist.m' }
            ];
            
Source_Directory = [Base_Directory '\Solution_Library\Scripts'];
cd(Source_Directory);
         
Target_Directory = [ Base_Directory '\NLABasic\Solution_Scripts' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 6th folder
% the following files reside in folder Solution_Library\Strategies
%                     and go to folder NLABasic\Solution_Scripts

% functions for NLABasic Version
FileNames = { 'S_InitialStep.m' ;
              'S_MultiStep.m' ;
              'S_MultiStep_wLoadHist.m' ;
              'S_MultiStep_wLoadHistwSD.m' ;
              'S_Transient_MultiStep.m' ;
              'S_Transient_MultiStepwSD.m' };
            
Source_Directory = [Base_Directory '\Solution_Library\Strategies'];
cd(Source_Directory);
         
Target_Directory = [ Base_Directory '\NLABasic\Solution_Scripts' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 7th folder
% the following files reside in the folder Geometry
%                     and go to the folder NLABasic\Element_Library

% functions of Basic Version
FileNames = { 'ElmLenOr.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'DefGeom_2dFrm.m' ;
                'DefGeom_3dFrm.m' ;
                'GeomTran_2dFrm.m' ;
                'GeomTran_3dFrm.m' ;
                'GeomTran_Truss.m' ;
                'kg_2dFrm.m' ;
                'kg_3dFrm.m' ;
                'kg_Truss.m' ;
                'Large2du2v_Frm.m' ;
                'Large3du2v_Frm.m' ;
                'TranJnt.m' }
            ];

Source_Directory = [Base_Directory '\Geometry'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Element_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 8th folder
% the following files reside in the folder Element_Library
%                     and go to the folder NLABasic\Element_Library

% functions for NLABasic Version
FileNames = { 'ElementLoading.m' ;
              'Extract_BasicEl2SecState.m' ;
              'Extract_El2MatState.m' ;
              'Extract_El2SecState.m' ;
              'ExtrReshu.m' ;
              'GPYS.m' };

Source_Directory = [Base_Directory '\Element_Library'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Element_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 9th folder
% the following files reside in the folder Element_Library\Frame_Elements
%                     and go to the folder NLABasic\Element_Library

% functions of Basic Version
FileNames = { 'DeformShape2dFrm.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'Check3dFrmAxes.m' ;
                'Create_PlasticLimitSurface.m' ;
                'DeformShape2dFrm_wCurvIntp.m' ;
                'DeformShape2dFrm_wDispIntp.m' }
            ];

Source_Directory = [Base_Directory '\Element_Library\Frame_Elements'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Element_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 10th folder
% the following files reside in the folder Element_Library\Frame_Elements\Linear
%                     and go to the folder NLABasic\Element_Library

% functions for NLABasic Version
FileNames = { 'LE2dFrm.m' ;
              'LE2dFrm_wPdelta.m' ;
              'LE3dFrm.m' ;
              'LETruss.m' };

Source_Directory = [Base_Directory '\Element_Library\Frame_Elements\Linear'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Element_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 11th folder
% the following files reside in the folder Element_Library\Frame_Elements\ConcentrInelastic
%                     and go to the folder NLABasic\Element_Library

% functions for NLABasic Version
FileNames = { 'BInel2dFrm_wEPLHM.m' ;
              'BInel2dFrm_wEPLHNMYS.m' ;
              'Inel2dFrm.m' ;
              'InelTruss.m' };

Source_Directory = [Base_Directory '\Element_Library\Frame_Elements\ConcentrInelastic'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Element_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 12th folder
% the following files reside in the folder Element_Library\Frame_Elements\DistrInelastic
%                     and go to the folder NLABasic\Element_Library

% functions for NLABasic Version
FileNames = { 'Dinel2dFrm_EBwDF.m' ;
              'Dinel2dFrm_EBwFF.m' };

Source_Directory = [Base_Directory '\Element_Library\Frame_Elements\DistrInelastic'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Element_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 13th folder
% the following files reside in the folder Element_Library\Special_Elements
%                     and go to the folder NLABasic\Element_Library

% functions for NLABasic Version
FileNames = { 'MaterialWrapper.m' ;
              'SectionWrapper.m' };

Source_Directory = [Base_Directory '\Element_Library\Special_Elements'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Element_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 14th folder
% the following files reside in the folder Section_Library
%                     and go to the folder NLABasic\Section_Library

% functions for NLABasic Version
FileNames = { 'Extract_Sec2MatState.m' ;
              'HomoCircSecw1dMat.m' ;
              'HomoRectSecw1dMat.m' ;
              'HomoWFSecw1dMat.m' ;
              'MultRectSecw1dMat.m' ;
              'ReCircSecw1dMat.m ' 
              'ReRectSecw1dMat.m' };

Source_Directory = [Base_Directory '\Section_Library'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Section_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end


%% 15th folder
% the following files reside in the folder Material_Library\1dMaterials
%                     and go to the folder NLABasic\Material_Library

% functions for NLABasic Version
FileNames = { 'BilinElastic1dMat.m' ;
              'BilinHyst1dMat.m' ;
              'BilinInel1dMat.m' ;
              'BilinOrOr1dMat.m' ;
              'BilinPkOr1dMat.m' ;
              'GMP1dMat.m ' ;
              'InelLPwLH1dMat.m' ;
              'ManderConcr1dMat.m' };

Source_Directory = [Base_Directory '\Material_Library\1dMaterials'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Material_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

%% 16th folder
% the following files reside in the folder Material_Library\3dMaterials
%                     and go to the folder NLABasic\Material_Library

% functions for NLABasic Version
FileNames = { 'InelJ2PwLH3dMat.m' };

Source_Directory = [Base_Directory '\Material_Library\3dMaterials'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Material_Library' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 17th folder
% the following files reside in folder  Utilities\General
%                     and go to folder  NLABasic\Utility_Functions\General

% functions of Basic Version
FileNames = { 'CleanStart.m' ;
              'Create_Units.m' ;
              'D_index.m' ;
              'H_index.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'Create_DispCyclewN.m' ;
                'Create_LoadHistory.m' ;
                'Create_MultDispCycleswN.m' ;
                'Print_PDFile.m' }
            ];

Source_Directory = [Base_Directory '\Utilities\General'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\General' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 18th folder
% the following files reside in folder  Utilities\Plotting
%                     and go to folder  NLABasic\Utility_Functions\Plotting

% functions of Basic Version
FileNames = { 'Create_Window.m' ;
              'Draw_Arrow.m' ;
              'Draw_Cube.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'Draw_3dAxisCross.m' ;
                'Draw_AxisCross.m' ;
                'Plot_DispPath.m' ;
                'Plot_EQRecord.m' ;
                'Plot_LoadHistory.m' ;
                'Plot_StoryDistr.m' ;
                'Plot_XYData.m' }
            ];
            
Source_Directory = [Base_Directory '\Utilities\Plotting'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\Plotting' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 19th folder
% the following files reside in folder Utilities\Plotting\Structure
%                     and go to folder NLABasic\Utility_Functions\Plotting

% functions of Basic Version
FileNames = { 'Get_HngPos4DefoElem.m' ;
              'Get_ModelScale.m' ;
              'Label_Model.m' ;
              'Plot_BounCond.m' ;
              'Plot_DeformedStructure.m' ;
              'Plot_ElemLoading.m' ;
              'Plot_Hinge4Elem.m' ;
              'Plot_Model.m' ;
              'Plot_NodalForces.m' ;
              'Plot_OpenPlasticHinges.m' ;
              'Plot_PlasticHinges.m' ;
              'Plot_Releases.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'Animate_EventSequence.m' ;
                'Animate_ResponsewHngHist.m' }
            ];
            
Source_Directory = [Base_Directory '\Utilities\Plotting\Structure'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\Plotting' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 20th folder
% the following files reside in folder Utilities\Plotting\Elements
%                     and go to folder NLABasic\Utility_Functions\Plotting

% functions of Basic Version
FileNames = { 'Label_2dMoments.m' ;
              'Label_AxialForces.m' ;
              'Plot_2dCurvDistr.m' ;
              'Plot_2dMomntDistr.m' ;
              'Plot_AxialForces.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'Get_IPVarDistr.m' ;
                'Plot_ForcDistr.m' ;
                'Plot_IPVarDistr.m' }
            ];
            
Source_Directory = [Base_Directory '\Utilities\Plotting\Elements'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\Plotting' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 21rst folder
% the following files reside in folder Utilities\Plotting\Sections
%                     and go to folder NLABasic\Utility_Functions\Plotting

% functions for NLABasic Version
FileNames = { 'FontProp4PlotSection.m' ;
              'LineProp4PlotSection.m' ;
              'Plot_Mesh4Circ.m' ;
              'Plot_Mesh4MultRectShape.m' ;
              'Plot_SectionGeometry.m' };
            
Source_Directory = [Base_Directory '\Utilities\Plotting\Sections'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\Plotting' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 21rst folder
% the following files reside in folder Utilities\PreProcessing\Elements
%                     and go to folder NLABasic\Utility_Functions\PreProcessing

% functions of Basic Version
FileNames = { 'ElemData2Qpl.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'AISC_Section.m' ;
                'AISC_Sections.mat' ;
                'Create_FrameSections.m' ;
                'ElemData4SteelBraces.m' ;
                'ElemData4SteelFrame.m' ;
                'FiberElemData4SteelBraces.m' ;
                'FiberElemData4SteelFrame.m' }
            ];
            
Source_Directory = [Base_Directory '\Utilities\PreProcessing\Elements'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\PreProcessing' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 22nd folder
% the following files reside in folder Utilities\PreProcessing\Structure
%                     and go to folder NLABasic\Utility_Functions\PreProcessing

% functions for NLABasic Version
FileNames = { 'Add_Brace2Frame.m' ;
              'Add_GravityColumn2Frame.m' ;
              'Create_JntOffsets.m' ;
              'Create_Load4Frame.m' ;
              'Create_Mass4Frame.m' ;
              'Create_MRFrame.m' };
            
Source_Directory = [Base_Directory '\Utilities\PreProcessing\Structure'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\PreProcessing' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 23rd folder
% the following files reside in folder Utilities\PreProcessing\Sections
%                     and go to folder NLABasic\Utility_Functions\PreProcessing

% functions for NLABasic Version
FileNames = { 'Add_Bars2Section.m' ;
              'Add_Shape2Section.m' ;
              'CircLayer2Bar.m' ;
              'Create_BoxOutline.m' ;
              'Create_BoxwOvhOutline.m' ;
              'Create_CircBarGrid.m' ;
              'Create_CSecOutline.m' ;
              'Create_IPMesh4Circ.m' ;
              'Create_IPMesh4MultRectShape.m' ;
              'Create_IPMesh4Rect.m' ;
              'Create_IPMesh4WFShape.m' ;
              'Create_ISecOutline.m' ; 
              'Create_LSecOutline.m' ;
              'Create_MPMesh4Circ.m' ;
              'Create_MultRectShape.m' ;
              'Create_RectBarGrid.m' ;
              'Create_RectOutline.m' ;
              'Create_RectPatch.m' ;
              'Create_RectShape.m' ;
              'Create_RectwCovOutline.m' ;
              'Create_ShapewMat.m' ;
              'Create_SSecOutline.m' ;
              'Create_TSecOutline.m' ;
              'MP1dInt4Circ.m' ;
              'MP2dInt4Circ.m' ;
              'Rectangle2Fiber.m' };
            
Source_Directory = [Base_Directory '\Utilities\PreProcessing\Sections'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\PreProcessing' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 24th folder
% the following files reside in folder Utilities\PostProcessing
%                     and go to folder NLABasic\Utility_Functions\PostProcessing

% functions of Basic Version
FileNames = { 'Complete_QV.m' ;
              'Post2Q.m' ;
              'Q2Post.m' };

% additional functions for NLABasic Version
FileNames = [ FileNames ;
              { 'Add_OpenPHIndx2Post.m' ;
                'Create_NMInterDiagram.m' ;
                'Get_HFlrTrans.m' ;
                'Get_StDrift.m' ;
                'Get_StShear.m' ;
                'Get_StShearPD.m' ;
                'Get_Veps.m' }
            ];
            
Source_Directory = [Base_Directory '\Utilities\PostProcessing'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\PostProcessing' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 25th folder
% the following files reside in folder Utilities\Interpolation
%                     and go to folder NLABasic\Utility_Functions\Interpolation

% functions for NLABasic Version
FileNames = { 'Hermite.m' ;
              'HermiteN.m' ;
              'Lagrange.m' ;
              'LagrangeN.m' };
            
Source_Directory = [Base_Directory '\Utilities\Interpolation'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\Interpolation' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

% ------------------------------------------------------------------------------------------
%% 26th folder
% the following files reside in folder Utilities\Quadrature
%                     and go to folder NLABasic\Utility_Functions\Quadrature

% functions for NLABasic Version
FileNames = { 'Gauss.m' ;
              'Lobatto.m' ;
              'Midpoint.m' ;
              'Radau.m' ;
              'Simpson.m' ;
              'Trap.m' };
            
Source_Directory = [Base_Directory '\Utilities\Quadrature'];
cd(Source_Directory);

Target_Directory = [ Base_Directory '\NLABasic\Utility_Functions\Quadrature' ];
for k = 1:length(FileNames)
  copyfile(FileNames{k},Target_Directory);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2. Step: create Help files for NLABasic Version
addpath 'c:\Drive D\Software\m2html';
Source_Directory = [ Base_Directory '\NLABasic' ];
cd(Source_Directory)
m2html ('mfiles',{ 'General_Functions' ...
                   'Analysis_Functions\Static' ...
                   'Analysis_Functions\Dynamic' ...
                   'Element_Library' ...
                   'Section_Library' ... 
                   'Material_Library' ... 
                   'Utility_Functions\General' ...
                   'Utility_Functions\Plotting' ...
                   'Utility_Functions\PreProcessing' ...
                   'Utility_Functions\PostProcessing' ...
                   'Utility_Functions\Interpolation' ...
                   'Utility_Functions\Quadrature' ...
                   },...
        'source','off','indexFile','FEDEASLab','htmlDir','Help');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 3. Step: generate p-files for specific functions and delete corresponding .m files

% 1rst folder
Directory = [ Base_Directory '\NLABasic\General_Functions' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);

% exclude the following files from the list
ind = [];
for j = 1:flen
  if strcmpi(files(j).name,'A_matrix.m'), ind = [ind j ]; end
  if strcmpi(files(j).name,'B_matrix.m'), ind = [ind j ]; end
  if strcmpi(files(j).name,'BbariBbarx_matrix.m'), ind = [ind j ]; end
  if strcmpi(files(j).name,'Fs_matrix.m'), ind = [ind j ]; end
  if strcmpi(files(j).name,'Ks_matrix.m'), ind = [ind j ]; end
  if strcmpi(files(j).name,'Q0_vector.m'), ind = [ind j ]; end
  if strcmpi(files(j).name,'V0_vector.m'), ind = [ind j ]; end
end
kList = 3:flen;
for k = setdiff(kList,ind)
  pcode (files(k).name);
  delete(files(k).name);
end

% 2nd folder
Directory = [ Base_Directory '\NLABasic\Analysis_Functions\Dynamic' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);
% exclude the first 2 files from the alphabetical list (. and ..)
for k = 3:flen
  pcode (files(k).name);
  delete(files(k).name);
end

% 3rd folder
Directory = [ Base_Directory '\NLABasic\Analysis_Functions\Static' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);
% exclude the first 2 files from the alphabetical list (. and ..)
for k = 3:flen
  pcode (files(k).name);
  delete(files(k).name);
end

% 4th folder
Directory = [ Base_Directory '\NLABasic\Element_Library' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);
% exclude the first 2 files from the alphabetical list (. and ..)
for k = 3:flen
  pcode (files(k).name);
  delete(files(k).name);
end

% 5th folder
Directory = [ Base_Directory '\NLABasic\Section_Library' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);
% exclude the first 2 files from the alphabetical list (. and ..)
for k = 3:flen
  pcode (files(k).name);
  delete(files(k).name);
end

% 6th folder
Directory = [ Base_Directory '\NLABasic\Material_Library' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);
% exclude the first 2 files from the alphabetical list (. and ..)
for k = 3:flen
  pcode (files(k).name);
  delete(files(k).name);
end

% 7th folder
Directory = [ Base_Directory '\NLABasic\Utility_Functions\General' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);

% exclude the following files from the list
ind = [];
for j = 1:flen
  if strcmpi(files(j).name,'CleanStart.m'),   ind = [ind j ]; end
  if strcmpi(files(j).name,'Create_Units.m'), ind = [ind j ]; end
end
kList = 3:flen;
for k = setdiff(kList,ind)
  pcode (files(k).name);
  delete(files(k).name);
end

% 8th folder
Directory = [ Base_Directory '\NLABasic\Utility_Functions\Interpolation' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);
% exclude the first 2 files from the alphabetical list (. and ..)
for k = 3:flen
  pcode (files(k).name);
  delete(files(k).name);
end

% 9th folder
Directory = [ Base_Directory '\NLABasic\Utility_Functions\Plotting' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);

% exclude the following files from the list
ind = [];
for j = 1:flen
  if strcmpi(files(j).name,'FontProp4PlotSection.m'), ind = [ind j ]; end
  if strcmpi(files(j).name,'LineProp4PlotSection.m'), ind = [ind j ]; end
end
kList = 3:flen;
for k = setdiff(kList,ind)
  pcode (files(k).name);
  delete(files(k).name);
end

% 10th folder
Directory = [ Base_Directory '\NLABasic\Utility_Functions\PostProcessing' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);
% exclude the first 2 files from the alphabetical list (. and ..)
for k = 3:flen
  pcode (files(k).name);
  delete(files(k).name);
end

% 11th folder
Directory = [ Base_Directory '\NLABasic\Utility_Functions\PreProcessing' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);

% exclude the following files from the list
ind = [];
for j = 1:flen
  if strcmpi(files(j).name,'AISC_Sections.mat'), ind = [ind j ]; end
end
kList = 3:flen;
% exclude the first 2 files from the alphabetical list (. and ..)
for k = setdiff(kList,ind)
  pcode (files(k).name);
  delete(files(k).name);
end

% 12th folder
Directory = [ Base_Directory '\NLABasic\Utility_Functions\Quadrature' ];
cd(Directory)
% generate list of files in Directory
files = dir(Directory);
flen  = length(files);
% exclude the first 2 files from the alphabetical list (. and ..)
for k = 3:flen
  pcode (files(k).name);
  delete(files(k).name);
end
