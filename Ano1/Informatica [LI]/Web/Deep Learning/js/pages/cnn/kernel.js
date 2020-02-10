const VERTICAL_KERNEL_INDEX = 0;
const HORIZONTAL_KERNEL_INDEX = 1;
const GAUSSIAN_KERNEL_INDEX = 2;
const XY_KERNEL_INDEX = 3;
const SHARPEN_KERNEL_INDEX = 4;

const Y_KERNEL = [1, 0, -1, 1, 0, -1, 1, 0, -1];
const X_KERNEL = [1, 1, 1, 0, 0, 0, -1, -1, -1];
const XY_KERNEL = [0, -1, 0, -1, 4, -1, 0, -1, 0];
const GAUSSIAN_KERNEL = [1/16, 1/8, 1/16, 1/8, 1/4, 1/8, 1/16, 1/8, 1/16];
const SHARPEN_KERNEL = [0,-1,0,-1,5,-1,0,-1,0];
let imgElement;

init();

function init() {
    imgElement = document.getElementById('imageSrc');
    let inputElement = document.getElementById('fileInput');

    imgElement.src = './../imagens/cat-hat.jpeg';

    inputElement.addEventListener('change', (e) => {
        imgElement.src = URL.createObjectURL(e.target.files[0]);
    }, false);
}

function onDropDownClicked(index) {
    switch (index) {
        case VERTICAL_KERNEL_INDEX:
            loadPresetKernel(Y_KERNEL);
            break;
        case HORIZONTAL_KERNEL_INDEX:
            loadPresetKernel(X_KERNEL);
            break;
        case GAUSSIAN_KERNEL_INDEX:
            loadPresetKernel(GAUSSIAN_KERNEL);
            break;
        case XY_KERNEL_INDEX:
            loadPresetKernel(XY_KERNEL);
            break;
        case SHARPEN_KERNEL_INDEX:
            loadPresetKernel(SHARPEN_KERNEL);
            break;
    }
}

function loadPresetKernel(kernel) {
    document.getElementById("kernel-0").value = kernel[0];
    document.getElementById("kernel-1").value = kernel[1];
    document.getElementById("kernel-2").value = kernel[2];
    document.getElementById("kernel-3").value = kernel[3];
    document.getElementById("kernel-4").value = kernel[4];
    document.getElementById("kernel-5").value = kernel[5];
    document.getElementById("kernel-6").value = kernel[6];
    document.getElementById("kernel-7").value = kernel[7];
    document.getElementById("kernel-8").value = kernel[8];
}

function load() {
    let mat = cv.imread(imgElement);

    let img = new cv.Mat();

    let dst = new cv.Mat();

    let kdata = [
        document.getElementById("kernel-0").value,
        document.getElementById("kernel-1").value,
        document.getElementById("kernel-2").value,
        document.getElementById("kernel-3").value,
        document.getElementById("kernel-4").value,
        document.getElementById("kernel-5").value,
        document.getElementById("kernel-6").value,
        document.getElementById("kernel-7").value,
        document.getElementById("kernel-8").value,
    ];

    let sum = 0;
    for (let i = 0; i < kdata.length; i++) {
        sum = sum + +kdata[i];
    }

    /**
     * Se a soma for 0 provavelmente estamos perante um kernel de detecção de arestas logo converte se a imagem para escala de cinzas
     */
    console.log(sum);
    if (sum === 0) {
        cv.cvtColor(mat, img, cv.COLOR_RGBA2GRAY, 0);
    }else{
        img = mat;
    }

    let d = cv.matFromArray(3, 3, cv.CV_32FC1, kdata);

    let anchor = new cv.Point(-1, -1);
    cv.filter2D(img, dst, cv.CV_8U, d, anchor, 0, cv.BORDER_DEFAULT);
    cv.imshow('canvasOutput', dst);
    if(mat.exists)
        mat.delete();
    dst.delete();
    img.delete();
    d.delete();
}

imgElement.onload = function () {
    load()
};


