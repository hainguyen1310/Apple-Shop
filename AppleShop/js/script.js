function move(direction) {
    const list = document.getElementById('horizontalList');
    const scrollAmount = 300; // Adjust as needed

    if (direction === 'left') {
        list.scrollLeft -= scrollAmount;
    } else if (direction === 'right') {
        list.scrollLeft += scrollAmount;
    }
}
