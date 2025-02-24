function [x,v] = volfinder(Filename) 

image=imread(Filename);
image1=im2bw(image,0.04);
image2=imcomplement(image1);
[centers,radii] = imfindcircles(image2,[5 15],'ObjectPolarity','dark','Sensitivity',0.93);
rad = radii*10/45;
vols = (4/3)*pi*(rad).^3;
N = length(vols)
voltot = sum(vols)
figure
imshow(image2)
h = viscircles(centers,radii);
% figure
% imshow(image2)
figure
hst = histogram(vols,100);
v = hst.Values;
lim = hst.BinLimits;
x = linspace(lim(1),lim(2),100);
AUC = sum(x.*v)
xlim([5 50])

end