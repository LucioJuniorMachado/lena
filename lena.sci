scicv_Init();

img = imread(getSampleImage("lena.jpg"));

sigma = 1.0;
img_blur = GaussianBlur(img, [5, 5], sigma);

matplot(img_blur);

delete_Mat(img);
delete_Mat(img_blur);

scicv_Init();

img = imread(getSampleImage("lena.jpg"), CV_LOAD_IMAGE_GRAYSCALE);

subplot(1,2,1);
matplot(img);

// convert to black/white and reverse, image information is white pixels (value 1) but we want to erode black pixels (value 0)
[res, img_bw] = threshold(img, 127, 255, THRESH_BINARY_INV);

element = getStructuringElement(MORPH_RECT, [5 5]);
img_erode = erode(img_bw, element);

// we need to reverse again before display
img_erode_reverse = bitwise_not(img_erode);

subplot(1,2,2);
matplot(img_erode_reverse);

delete_Mat(img);
delete_Mat(img_bw);
delete_Mat(element);
delete_Mat(img_erode);
delete_Mat(img_erode_reverse);
