#include "Controller.h"
#include "..\..\GearsService\GearsContract.h"

using namespace maf::messaging::ipc;
using namespace maf::messaging;

class ScanRequestMessage :public maf::messaging::InternalMessage {
};

void Controller::handleResults(const QString&string) {
    _scanningValue = string;
    emit scanningValueChanged();
}

Controller::Controller() {
	/*ScanningProcess* process = new ScanningProcess();
	process->moveToThread(&workerThread);
	connect(&workerThread, SIGNAL(finished()), process, SLOT(deleteLater()));
	connect(this, SIGNAL(operate()), process, SLOT(doWork()));
	connect(process, SIGNAL(resultReady(QString)), this, SLOT(handleResults(QString)));*/

	workerThread.start();
	_comp.onSignal<ScanRequestMessage>([this] {
		_serviceProxy->sendRequest<ScanningStatusResult>([this](const std::shared_ptr<ScanningStatusResult>& status) {
			_scanningValue = QString::fromStdString(std::to_string(status->props().get_percentage()) + "%");
			emit scanningValueChanged();
		});
	});

	_comp.start([this] {
		_serviceProxy = LocalIPCServiceProxy::createProxy(SERVICE_ID_SCANNING_SERVICE);
		});
}

Controller::~Controller() {
	workerThread.quit();
    workerThread.wait();
}

void Controller::onClicked() {
	//emit operate();
	_comp.postMessage<ScanRequestMessage>();
}
void Controller::setScanningValue(QString string){
    _scanningValue = string;
    emit scanningValueChanged();
}

QString Controller::getScanningValue()
{
    return _scanningValue;
}
