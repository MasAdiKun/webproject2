<script type="text/javascript">
    // slider
    let start = 0;
    otomatis();
    function otomatis()	{
            const sliders = document.querySelectorAll(".slider");

            for (let i = 0; i < sliders.length; i++)
            {
                    sliders[i].style.display = "none";
            }
            if (start >= sliders.length)
            {
                    start = 0;
            }

            sliders[start].style.display = "block";
            console.log("pict" + start);
            start++;

            setTimeout(otomatis, 3000);	
    }

    // navbar
    const bar = document.getElementById('bar');
    const close = document.getElementById('close');
    const nav = document.getElementById('navlist');

    if (bar) {
            bar.addEventListener('click', () => {
                    nav.classList.add('active');
            });
    }
    if (close) {
            close.addEventListener('click', () => {
                    nav.classList.remove('active');
            });
    }
</script>

