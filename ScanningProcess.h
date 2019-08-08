#include <qobject.h>
#include <qthread.h>
class ScanningProcess : public QObject
{
	Q_OBJECT
	QThread workerThread;

private:
	int count = 0;

public:
	ScanningProcess();
	~ScanningProcess();

public slots:
	void doWork();

signals:
	void resultReady(const QString& result);
};

