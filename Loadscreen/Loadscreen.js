const handlers = {

    initFunctionInvoked(data) {
        document.querySelector('.right p').innerHTML = "Loading content: " + data.name;
    },

    onDataFileEntry(data) {
        document.querySelector('.right p').innerHTML = "Loading content: " + data.name;
    },

    onLogLine(data) {
        document.querySelector('.right p').innerHTML = data.message;
    }
};

var sound = new Howl({
    src: ["Sound.ogg"],
    autoplay: true,
    loop: true,
    volume: 0.5
});

sound.play();

window.addEventListener('message', function(e) {
    (handlers[e.data.eventName] || function() {})(e.data);
});