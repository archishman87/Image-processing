function [] = dropvol(file)
% % Create a video writer object
% writerObj = VideoWriter('volvideo.avi');
% % Set frame rate
% writerObj.FrameRate = framerate;
% % Open video writer object and write frames sequentially
% open(writerObj)
format short
% Read the tif image sequence exported from imageJ
% Files=dir('*.tif');
voltots = [];
for k=1:length(Files)
   Filename=Files(k).name;
   image=imread(Filename);
   [centers,radii] = imfindcircles(image,[10 10000],'ObjectPolarity','dark','Sensitivity',0.93);
   vols = (4/3)*pi*(radii/15.81).^3;
   voltot = sum(vols);
   voltots = [voltots;voltot];
   im = imshow(image)
   h = viscircles(centers,radii);
   frame2 = [num2str(Filename) '-out.tif'];
   saveas(im,frame2)
% Write a new video with the annotated tif series
    input = imread(frame2);
    writeVideo(writerObj, input);
end
close(writerObj);
t = 4.8387*[0:30]';
plot(t,voltots,'ro')
end