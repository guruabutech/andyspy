<?

class ServerRequest extends WritablePersistence
{
    protected $id, $id_device, $request, $params, $status, $added_at;

    public function __construct($id = null, $id_device = null, $request = null, $params = null, $status = null, $added_at = null)
    {
        parent::__construct();
        $this->id = $id;
        $this->id_device = $id_device;
        $this->request = $request;
        $this->params = $params;
        $this->status = $status;
        $this->added_at = $added_at;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getIdDevice()
    {
        return $this->id_device;
    }

    public function getRequest()
    {
        return $this->request;
    }

    public function getParams()
    {
        return $this->params;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getAddedAt()
    {
        return $this->added_at;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function setIdDevice($id_device)
    {
        $this->id_device = $id_device;
    }

    public function setRequest($request)
    {
        $this->request = $request;
    }

    public function setParams($params)
    {
        $this->params = $params;
    }

    public function setStatus($status)
    {
        $this->status = $status;
    }

    public function setAddedAt($added_at)
    {
        $this->added_at = $added_at;
    }
}