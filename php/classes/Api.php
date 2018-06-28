<?php

/**
 * Created by Nkconcept.
 * Date: 26/06/2017
 * Time: 17:29
 */
class Api implements HttpRequestExecuter
{
    /**
     * @var string
     */
    public static $MEDIA_FILES_UPLOAD_PATH = "../upload/";

    /**
     * @param $username
     * @param $name
     * @return Response
     * @throws Exception
     * @throws UserFriendlyException
     * @execution(index="bind-device",isAjax="true")
     */
    public static function bindDevice($username, $name)
    {
        if( !strlen($name) ) throw new UserFriendlyException("Device name missing","Failed",1000);
        if (!User::columnValueExists("username", $username)) throw new UserFriendlyException("User not found", "Failed", 1000);
        $User = new User(null, null, null, $username);
        $User->load();
        $id_device = Device::insert(new Device(null, $name, $User->getId()));
        return new Response(
            array(
                "status" => true,
                "username" => $username,
                "id_device" => $id_device,
                "r_to" => HttpRequestPost::getAll()->toArray()
            )
        );
    }

    /**
     * @param $id_device
     * @return Response
     * @throws UserFriendlyException
     * @execution(index="send-media",isAjax="true")
     */
    public static function receiveMedia($id_device)
    {
        if (!Device::columnValueExists("id", $id_device)) throw new UserFriendlyException("Uknown device", "Failed", 1001);
        $Device = new Device($id_device);
        $Device->load();

        if (!HttpRequestPost::getAll()->indexExists("media_type")) throw new UserFriendlyException("Media type missing", "Failed", 1002);
        $media_type = HttpRequestPost::get("media_type")->getValue();
        $data = new Row($_REQUEST);
        switch ($media_type) {
            case "sms":
                Sms::bindTo($Device, $data);
                break;
            case "call":
                Call::bindTo($Device, $data);
                break;
            default:
                throw new UserFriendlyException("Unknown media type", "Failed", 1003);
        }

        return new Response(
            array(
                "status" => true,
                "r_to" => HttpRequestPost::getAll()->toArray()
            )
        );
    }

    /**
     * @param $id_device
     * @return Response
     * @throws UserFriendlyException
     * @Execution(index="get-parameters",isAjax="true")
     */
    public static function getParameters($id_device)
    {
        if (!Device::columnValueExists("id", $id_device)) throw new UserFriendlyException("Uknown device", "Failed", 1001);
        $Device = new Device($id_device);
        $Device->load();
        $Device->setSync("Y");
        $Device->save();

        return new Response(
            array(
                "allowed_sync_network" => $Device->getAllowedSyncNetwork(),
                "sync_time_interval" => $Device->getSyncTimeInterval(),
                "status" => true,
                "r_to" => HttpRequestPost::getAll()->toArray()
            )
        );
    }
}