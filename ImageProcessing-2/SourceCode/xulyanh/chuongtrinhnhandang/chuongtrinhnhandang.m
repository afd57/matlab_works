function varargout = chuongtrinhnhandang(varargin)
% CHUONGTRINHNHANDANG M-file for chuongtrinhnhandang.fig
%      CHUONGTRINHNHANDANG, by itself, creates a new CHUONGTRINHNHANDANG or raises the existing
%      singleton*.
%
%      H = CHUONGTRINHNHANDANG returns the handle to a new CHUONGTRINHNHANDANG or the handle to
%      the existing singleton*.
%
%      CHUONGTRINHNHANDANG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHUONGTRINHNHANDANG.M with the given input arguments.
%
%      CHUONGTRINHNHANDANG('Property','Value',...) creates a new CHUONGTRINHNHANDANG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chuongtrinhnhandang_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chuongtrinhnhandang_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chuongtrinhnhandang

% Last Modified by GUIDE v2.5 16-May-2008 22:19:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chuongtrinhnhandang_OpeningFcn, ...
                   'gui_OutputFcn',  @chuongtrinhnhandang_OutputFcn, ...
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


% --- Executes just before chuongtrinhnhandang is made visible.
function chuongtrinhnhandang_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chuongtrinhnhandang (see VARARGIN)

% Choose default command line output for chuongtrinhnhandang
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chuongtrinhnhandang wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chuongtrinhnhandang_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Load_Image.
function Load_Image_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile({'*.bmp';'*.jpg';'*.gif';'*.*'}, 'Pick an Image File');
S = imread([pathname,filename]);
axes(handles.axes1);
imshow(S);

handles.S = S;
guidata(hObject, handles);
% hObject    handle to Load_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Edge_Detection.
function Edge_Detection_Callback(hObject, eventdata, handles)
b=get(handles.edit1,'String');
S = handles.S;
axes(handles.axes2);
a=rgb2gray(S);
bw=edge(a,b);
bw = bwareaopen(bw,30);
se = strel('disk',2);
bw = imclose(bw,se);
bw = imfill(bw,'holes');
imshow(bw);
handles.bw = bw;

% hObject    handle to Edge_Detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Recognize.
function Recognize_Callback(hObject, eventdata, handles)
global i;
b=get(handles.edit1,'String');
S = handles.S;
axes(handles.axes3);
format long;
a=rgb2gray(S);
bw=edge(a,b);
bw = bwareaopen(bw,30);
se = strel('disk',2);
bw = imclose(bw,se);
bw = imfill(bw,'holes');
L = bwlabel(bw);
s  = regionprops(L, 'centroid');
dt  = regionprops(L, 'area');
dim = size(s);
BW_filled = imfill(bw,'holes');
boundaries = bwboundaries(BW_filled);
imshow(S);
hold on;
for k=1:dim(1)
    b= boundaries{k};
    dim = size(b);
    for i=1:dim(1)
        khoangcach{k}(1,i) = sqrt ( ( b(i,2) - s(k).Centroid(1) )^2 + ( b(i,1) - s(k).Centroid(2) )^2 );
    end 
    a=max(khoangcach{k});
    b=min(khoangcach{k});
    c=dt(k).Area;
    dolech=a-b;
    vuong = c/(4*b^2);
    chunhat=c/(4*b*(a^2-b^2)^0.5);
    tamgiacdeu=(c*3^0.5)/((a+b)^2);
    elip =c/(a*b*pi);
    thoi= (c*( a^2 - b^2 )^0.5) / (2*a^2*b);
    if dolech < 10
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'circle');
    elseif (vuong < 1.05 ) & (vuong > 0.95 )
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'square');
    elseif (elip < 1.05 ) & (elip > 0.95 )
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'ellipse');
    elseif (thoi < 1.05 ) & (thoi > 0.95 )
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'diamond');
    elseif ((chunhat <1.05) & (chunhat >0.95))
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'rectangle');
    elseif  (tamgiacdeu < 1.05 ) & (tamgiacdeu > 0.95 )
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'triangle');
    end
end

% hObject    handle to Recognize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


