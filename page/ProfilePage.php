<?php

class ProfilePage
{
    public $zzpForm;
    public $bedrijfForm;

    public $profileForm;

    private $urlArr;
    public $profileCard;

    public function __construct($urlArr)
    {
        $this->urlArr = $urlArr;

        $this->get_profile($urlArr['pageVars'][0]);

        // Selecting the first value in the pageVars array
        if ($urlArr['pageVars'][0] == 'zzp') {
            //$this->profile_zzp();
        } else if ($urlArr['pageVars'][0] == 'bedrijf') {
            //$this->profile_bedrijf();
        } else {
            header("Refresh: 2; url=" . $urlArr['baseUrl'] . "home");
        }

    }

    private function get_profile($type)
    {
        if ($type == 'zzp') $table = 'profile_se';
        else $table = 'profile_co';

        $db = new Database();
        $db->query('SELECT 
	                            `user`.*, 
                                `profile`.* 
                            FROM `user` 
                            LEFT JOIN ' . $table . ' AS `profile` USING(user_id)
                            WHERE `user`.`user_id` = :userId;');
        $db->bind(':userId', ApplicationController::sanitize($_SESSION['id']));

        if ($userInfo = $db->single()) {
            $this->profileForm = ApplicationController::get_part_string('profile/' . $type, array('baseUrl' => $this->urlArr['baseUrl'], 'userInfo' => $userInfo));
        }

    }

    private function profile_zzp()
    {
        $this->zzpForm = ApplicationController::get_part_string('profile/zzp', array('baseUrl' => $this->urlArr['baseUrl']));
        $user_id = ApplicationController::sanitize($_SESSION['id']);


//        if (isset($user_id)) {
//            $db = new Database();
//            $db->query('SELECT * FROM `user` WHERE user_id = :user_id');
//            $db->bind(':user_id', $user_id);
//
//            if  ($db->rowCount() > 1) {
////                header("refresh:2; url=/home");
//                die('<div class="alert alert-danger" role="alert">Dit profiel bestaat niet</div>');
//            } else {
//                {
//                    $db = new Database();
//                    $db->query('SELECT `profile_se`.*, `user`.number, `user`.email FROM `profile_se` LEFT JOIN `user` ON profile_se.user_id = :user_id;');
//                    $db->bind(':user_id', $user_id);
//                    $firstname = $db->single()['firstname'];
//                    $infix = $db->single()['infix'];
//                    $lastname = $db->single()['lastname'];
//                    $birthday = $db->single()['birthday'];
//                    $gender = $db->single()['gender'];
//                    $nationality = $db->single()['nationality'];
//                    $number = $db->single()['number'];
//                    $about = $db->single()['about'];
//
//                    echo $firstname . ' ' . $infix . ' ' . $lastname . ' ' . $birthday . ' ' . $gender . ' ' . $nationality . ' ' . $number . ' ' . $about;
//
//                }
//
//            }
//        }
    }


    private function profile_bedrijf()
    {
        $this->bedrijfForm = ApplicationController::get_part_string('profile/bedrijf', array('baseUrl' => $this->urlArr['baseUrl']));
    }
}