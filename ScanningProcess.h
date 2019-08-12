#include <qobject.h>
#include <qthread.h>
#include <maf/messaging/client-server/ipc/LocalIPCServiceProxy.h>
#include <maf/messaging/Component.h>

#define MAX_SCANNING_VALUE 20
#define MIN_SCANNING_VALUE	0

class ScanningProcess : public QObject
{
	Q_OBJECT
	//QThread workerThread;

private:
	static ScanningProcess* m_instance;
	int _scanningValue = 0;
	std::shared_ptr<maf::messaging::ipc::LocalIPCServiceProxy> _serviceProxy;
	maf::messaging::Component _comp;
	maf::messaging::RegID _scanrequestId;
	ScanningProcess();
public:
	static ScanningProcess* getInstance();
public slots:
	void startWork();
signals:
	void resultReady(int result);

};

