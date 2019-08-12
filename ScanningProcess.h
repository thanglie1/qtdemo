#include <qobject.h>
#include <qthread.h>
#include <maf/messaging/client-server/ipc/LocalIPCServiceProxy.h>
#include <maf/messaging/Component.h>

#define MAX_SCANNING_VALUE 10
#define MIN_SCANNING_VALUE	0

class ScanningProcess : public QObject
{
	Q_OBJECT
	//QThread workerThread;

private:
	ScanningProcess();
	static ScanningProcess* m_instance;
	int _scanningValue = 0;
	std::shared_ptr<maf::messaging::ipc::LocalIPCServiceProxy> _serviceProxy;
	maf::messaging::Component _comp;
	maf::messaging::RegID _scanrequestId;
public:
	static ScanningProcess* getInstance();
public slots:
	void startWork();

signals:
	void resultReady(int result);

};

