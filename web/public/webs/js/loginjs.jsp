<script type="text/javascript">
    var x = document.getElementById('login');
    var y = document.getElementById('register');
    var z = document.getElementById('btn');

    function register(){
            x.style.left = "-450px";
            y.style.left = "50px";
            z.style.left = "110px";
    }
    function login(){
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0px";
    }

    var username = document.getElementById('uname');
    var pass = document.getElementById('pass');
    var username_val = document.getElementById('username_val');
    var pass_val = document.getElementById('pass_val');

    function validation(){
            if(username.value.length === 0){
                    username.style.border = '1.5px solid red';
                    username_val.style.display = 'block';
                    username.focus();
                    return false;
            }else{
                    username.style.border= 'none';
                    username_val.style.display='none';
            };

            if(pass.value.length === 0){
                    pass.style.border = '1.5px solid red';
                    pass_val.style.display = 'block';
                    pass.focus();
                    return false;
            }else {
                    pass.style.border='none';
                    pass_val.style.display='none';
            };
    };

    function enable(){
            var check = document.getElementById("check");
            var regis = document.getElementById("regis");
            if(!check.checked){
                    regis.setAttribute("disabled","disabled");
            }else {
                    regis.removeAttribute("disabled");
            };
    }
</script>