function varargout = gui(varargin)
% GUI M-file for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 17-May-2015 09:04:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%sec butonu 
index_select = get(handles.listbox1,'Value');
if index_select == 1
    set(handles.text2,'string','Meyve Sayma Uygulamasi');
    guidata(hObject, handles);
handles.im = imread(imgetfile());
axes(handles.axes1);
imshow(handles.im),title('Meyveden Bir Par�a Al�n�z!');


[handles.output1 handles.output2 handles.output3 handles.output4] =function_meyvesay(handles.im);
axes(handles.axes2);
imshow(handles.output1),title('ikili resme D�n���m');
%xlabel('Renk Tabanli Segmentasyon ')
axes(handles.axes3);
imshow(handles.output2),title('Morfolojik ��lem');
axes(handles.axes4);
imshow(handles.output3,[]),title('Wathershed Distance ');
axes(handles.axes5);

imshow(handles.im),title('son');
hold on
[B,L] = bwboundaries(handles.output4,'noholes');

stats = regionprops(L,'Area','Centroid');
ang=0:0.01:2*pi; 
xp=5*cos(ang);
yp=5*sin(ang);

for k=1:length(B);
     area = stats(k).Area;
     centroid = stats(k).Centroid;
     %plot(centroid(1),centroid(2),'ko')
     %plot(centroid(1)+xp,centroid(2)+yp,'LineWidth',1);
        text(centroid(1),centroid(2),sprintf('%d', k),'FontWeight','bold','EdgeColor',[0 0 0],'Color',[0 0 0]);
end

cc = bwconncomp(handles.output4);
set(handles.text1,'string',sprintf('Meyve Sayisi = %d' , cc.NumObjects));
hold off
elseif index_select == 2
    set(handles.text2,'string','Yildiz Sayimi');
    prompt={'Yildiz Boyutunu Giriniz:'};
    % Create all your text fields with the questions specified by the variable prompt.
    tittle='INPUT'; 
    % The main title of your input dialog interface.
    answer=inputdlg(prompt,tittle);
    boyut = str2num(answer{1}); 
    
    set(handles.text2,'string','Yildiz Sayma Uygulamasi');
    [handles.output1 output2 output3 output4 handles.output5] = uygulama_teleskop(boyut);
    axes(handles.axes1);
    imshow(handles.output1),title('Orjinal Resim');
    axes(handles.axes2);
    imshow(output2),title('Gri Seviyeli Resme D�n���m');
    axes(handles.axes3);
    imshow(output3),title('ikili Resim D�n���m');
    axes(handles.axes4);
    imshow(output4),title('Morfolojik Erozyon');
    axes(handles.axes5);
    imshow(handles.output1),title('Dilation ve sayma islemi')
    cc = bwconncomp(handles.output5)
    L = bwlabel(handles.output5);
    s = regionprops(L, 'BoundingBox', 'Extrema', 'Centroid');
    boxes = cat(1, s.BoundingBox);
    left_edge = boxes(:,1);
    [sorted, sort_order] = sort(left_edge);
    s2 = s(sort_order);
    %imshow(im_er_di, 'InitialMag', 'fit')
    hold on
for k = 1:numel(s2)
   centroid = s2(k).Centroid;
   %text(centroid(1), centroid(2), sprintf('%d', k));
   
   text(centroid(1),centroid(2),sprintf('%d', k),'FontWeight','bold','EdgeColor',[1 0 0],'Color',[0.8471 0.1608 0]);
end
hold off

set(handles.text1,'string',sprintf('%d Yaricapli \n \n Yildiz Sayisi = %d' , boyut,cc.NumObjects));
elseif index_select == 3
    set(handles.text2,'string','Kusur1');
    [output1  output2 output3 output4] = defect();
    axes(handles.axes1);
    imshow(output1),title('Kusurlu �r�n');
    axes(handles.axes2);
    imshow(output2),title('E�iklime ��lemi');
    axes(handles.axes3);
    imshow(output3),title('Morfolojik Yayma');
    axes(handles.axes4);
    imshow(output4),title('Morfolojik A�ma');
    axes(handles.axes5);
    
    [i,j]= find(output4==0);
    imshow(imread('def3.jpg'))
    hold on
    plot(j,i,'r+');
    hold off
elseif index_select == 4
    set(handles.text2,'string','Kusur 2');
    [output1  output2 output3 output4] = defect2();
    axes(handles.axes1);
    imshow(output1),title('Kusurlu �r�n');
    axes(handles.axes2);
    imshow(output2),title('E�iklime ��lemi');
    axes(handles.axes3);
    imshow(output3),title('Morfolojik Yayma');
    axes(handles.axes4);
    imshow(output4),title('Morfolojik A�ma');
    axes(handles.axes5);
    
    [i,j]= find(output4==0);
    imshow(imread('def1.jpg'))
    hold on
    plot(j,i,'r+');
    hold off
elseif index_select == 5
    set(handles.text2,'string','Trafik Levhasi');
    im = imread(imgetfile());
    [output1  output2 output3 output4 output5] = trafik(im);
    axes(handles.axes1);
    imshow(output1,[])
    xlabel('Orijinal Resim')
    axes(handles.axes2);
    imshow(output2,[])
    xlabel('Segmentasyon')
    axes(handles.axes3);
    imshow(output3,[])
    xlabel('Morfolojik Islemler')
    axes(handles.axes4);
    imshow(output4,[])
    xlabel('Seklin Belirlenmesi')
    axes(handles.axes5);
    sonuc = output5;
    imshow(output1,[])
    if sonuc == 1
    %t = title('UCGEN')
    xlabel('UCGEN')
        set(handles.text1,'string','Tabela Ucgen');
    elseif sonuc == 2
    xlabel('DAIRE')
        set(handles.text1,'string','Tabela Daire');
    %t = title('DAIRE')
    elseif sonuc == 3
    xlabel('RECT')
        set(handles.text1,'string','Tabela Rect');
    %t = title('RECT')  

end
    
    
    
    
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%sec butonu 



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes1


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Buyut.
function Buyut_Callback(hObject, eventdata, handles)
% hObject    handle to Buyut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
index_select = get(handles.listbox1,'Value');
if index_select == 1
    figure
    imshow(handles.im)
    [B,L] = bwboundaries(handles.output4,'noholes');
    stats = regionprops(L,'Area','Centroid');
    ang=0:0.01:2*pi; 
    xp=5*cos(ang);
    yp=5*sin(ang);

for k=1:length(B);
     area = stats(k).Area;
     centroid = stats(k).Centroid;
     %plot(centroid(1),centroid(2),'ko')
     %plot(centroid(1)+xp,centroid(2)+yp,'LineWidth',1);
     text(centroid(1),centroid(2),sprintf('%d', k),'FontWeight','bold','EdgeColor',[0 0 0],'Color',[0 0 0]);
end
elseif index_select == 2
    figure
    imshow(handles.output1)%,title('Dilation ve sayma islemi')
    cc = bwconncomp(handles.output5)
    L = bwlabel(handles.output5);
    s = regionprops(L, 'BoundingBox', 'Extrema', 'Centroid');
    boxes = cat(1, s.BoundingBox);
    left_edge = boxes(:,1);
    [sorted, sort_order] = sort(left_edge);
    s2 = s(sort_order);
    %imshow(im_er_di, 'InitialMag', 'fit')
    hold on
for k = 1:numel(s2)
   centroid = s2(k).Centroid;
   %text(centroid(1), centroid(2), sprintf('%d', k));
   
   text(centroid(1),centroid(2),sprintf('%d', k),'FontWeight','bold','EdgeColor',[1 0 0],'Color',[0.8471 0.1608 0]);
end
hold off
elseif index_select == 3
end
