var imgIndex =0;
var timerCarousel;

onload = function () {
    images = [
        "Economy.jpg",
        "Education.jpg",
        "Energy.JPG",
        "Environment.jpeg",
        "Finance.jpg",
        "FireAndEmergencyResponse.JPG",
        "Governance.jpg",
        "Health.JPG",
        "Innovation.jpg",
        "Safety.JPG",
        "Recreation.jpeg",
        "Shelter.JPG",
        "SolidWaste.jpeg",
        "Telecommunication.jpg",
        "Transportation.JPG",
        "UrbanPlanning.JPG",
        "Wastewater.jpg",
        "WaterAndSanitation.JPG"
    ];
    imagesDescription = [
        "Economy",
        "Education",
        "Energy",
        "Environment",
        "Finance",
        "Fire and Emergency Response",
        "Governance",
        "Health",
        "Innovation",
        "Safety",
        "Recreation",
        "Shelter",
        "Solid Waste",
        "Telecommunication",
        "Transportation",
        "Urban Planning",
        "Waste Water",
        "Water and SanitationJPG"
    ];

    document.getElementById("leftButton").addEventListener('click', () => {
        imgIndex = (imgIndex - 1 + images.length) % images.length;
        changeImage(imgIndex)
        clearTimeout(timerCarousel);
        timerCarousel = setTimeout(nextImage, 3 * 1000);
    });

    document.getElementById('rightButton').addEventListener('click', function () {
        imgIndex = (imgIndex + 1) % images.length;
        changeImage(imgIndex);
        clearTimeout(timerCarousel);
        timerCarousel = setTimeout(nextImage, 3 * 1000);
    });

    timerCarousel = setTimeout(nextImage, 3 * 1000);
};

function nextImage() {
    imgIndex = (imgIndex + 1) % images.length;
    changeImage(imgIndex);
    timerCarousel = setTimeout(nextImage, 3 * 1000);
}

function changeImage(imageNumber) {
    var image = document.getElementById('carousel');
    image.src = images[imageNumber];
    image.alt = imagesDescription[imageNumber];
    document.getElementById('description').innerHTML = imagesDescription[imageNumber];
}