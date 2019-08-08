#include <qobject.h>
#include <qthread.h>
#include <ScanningProcess.h>
#include <maf/messaging/client-server/ipc/LocalIPCServiceProxy.h>
#include <maf/messaging/Component.h>

class Controller : public QObject
{
	Q_OBJECT
    QThread workerThread;
    Q_PROPERTY(QString scanningValue READ getScanningValue WRITE setScanningValue NOTIFY scanningValueChanged)

private:
    QString _scanningValue = "0%";
	std::shared_ptr<maf::messaging::ipc::LocalIPCServiceProxy> _serviceProxy;
	maf::messaging::Component _comp;

public:
	Controller();
	~Controller();
    void setScanningValue(QString scanningValue);
    QString getScanningValue();
public slots:
	void handleResults(const QString &);
    void onClicked();
signals:
    void scanningValueChanged();
	void operate();

};
