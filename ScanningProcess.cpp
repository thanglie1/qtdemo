#include "ScanningProcess.h"
#include "..\..\gears-service\GearsContract.h"
using namespace maf::messaging::ipc;
using namespace maf::messaging;

class ScanRequestMessage :public maf::messaging::InternalMessage {
};

ScanningProcess* ScanningProcess::m_instance = 0;

ScanningProcess::ScanningProcess() {
	_comp.onSignal<ScanRequestMessage>([this] {
		_scanrequestId = _serviceProxy->sendRequest<ScanningStatusResult>([this](const std::shared_ptr<ScanningStatusResult>& status) {
			_scanningValue = status->props().get_percentage();
			emit resultReady(_scanningValue);
			});
		});
	_comp.start([this] {
		_serviceProxy = LocalIPCServiceProxy::createProxy(SERVICE_ID_SCANNING_SERVICE);
		});
}
ScanningProcess* ScanningProcess::getInstance() {
	if (m_instance == NULL)
	{
		m_instance = new ScanningProcess();
	}
	return m_instance;
}
void ScanningProcess::startWork() {
	_comp.postMessage<ScanRequestMessage>();
}
