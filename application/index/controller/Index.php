<?php

namespace app\index\controller;

use think\Controller;

class Index extends Controller{
    function index(){
        echo 33;exit;
        $this->fetch();
    }
}