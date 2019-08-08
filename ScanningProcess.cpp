#include "ScanningProcess.h"

ScanningProcess::ScanningProcess() {

}

ScanningProcess::~ScanningProcess(){
}

void ScanningProcess::doWork() {
    QThread::sleep(2);
    count++;
    QString param = QString::number(count)+"%";
    emit resultReady(param);
}
