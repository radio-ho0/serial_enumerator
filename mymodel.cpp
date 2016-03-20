#include "mymodel.h"

#include <QtSerialPort/QSerialPortInfo>

MyModel::MyModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

void MyModel::addSerialInfo(const SerialInfo &serial)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_serials << serial;
    endInsertRows();
}

int MyModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_serials.count();
}

QVariant MyModel::data(const QModelIndex &index, int role) const
{
    if(index.row() <0 || index.row() >= m_serials.count()){
        return QVariant();
    }
    const SerialInfo& bar = m_serials[index.row()];

    switch( role ){
        case NAME_ROLE :
            return bar.name();
        case DESCRIPTION_ROLE :
            return bar.description();
        case BUSY_ROLE:
            return bar.busy();
        case SYSTEM_LOCATION_ROLE:
            return bar.sysLocation();
        case MANUFACTURER_ROLE :
            return bar.manufacturer();
        case SERIAL_NUMBER_ROLE:
            return bar.serialNumber();
        case VENDOR_ROLE:
            return bar.vendor();
        case INDENTIFIER_ROLE:
            return bar.indentifier();
    }

    return QVariant();
}

void MyModel::refreshModel()
{
//    addSerialInfo(SerialInfo("USB1", "desc1"));
//    addSerialInfo(SerialInfo("USB2", "desc2"));

    foreach (const QSerialPortInfo &info, QSerialPortInfo::availablePorts()) {

        QString name              = info.portName();
        QString description       = info.description();
        QString busy              = (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No"));
        QString systemLocation    = info.systemLocation();
        QString manufacturer      = info.manufacturer();
        QString serialNumber      = info.serialNumber();
        QString vendorIdentifier  = (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString());
        QString productIdentifier = (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString());

        addSerialInfo(SerialInfo(name,
                                 description,
                                 busy,
                                 systemLocation,
                                 manufacturer,
                                 serialNumber,
                                 vendorIdentifier,
                                 productIdentifier
                      ));
    }

}

QHash<int, QByteArray> MyModel::roleNames() const
{
    QHash<int, QByteArray> roles;

    roles[NAME_ROLE]              = "name";
    roles[DESCRIPTION_ROLE]       = "description";
    roles[BUSY_ROLE]              = "busy";
    roles[SYSTEM_LOCATION_ROLE]   = "system_location";
    roles[MANUFACTURER_ROLE]      = "manufacturer";
    roles[SERIAL_NUMBER_ROLE]     = "serial_number";
    roles[VENDOR_ROLE]            = "vendor";
    roles[INDENTIFIER_ROLE]       = "identifier";

    return roles;
}


SerialInfo::SerialInfo(const QString &name,
                       const QString &description,
                       const QString& busy,
                       const QString& sysLocatioon,
                       const QString& manufacturer,
                       const QString& serialNumber,
                       const QString& vendor,
                       const QString& indentifier)
    : m_name(name),
      m_description(description),
      m_busy(busy),
      m_sysLocation(sysLocatioon),
      m_manufacturer(manufacturer),
      m_serialNumber(serialNumber),
      m_vendor(vendor),
      m_indentifier(indentifier)
{

}

QString SerialInfo::name() const
{
    return m_name;
}

QString SerialInfo::description() const
{
    return m_description;
}

QString SerialInfo::busy() const
{
    return m_busy;
}

QString SerialInfo::sysLocation() const
{
    return m_sysLocation;
}

QString SerialInfo::manufacturer() const
{
    return m_manufacturer;
}

QString SerialInfo::serialNumber() const
{
    return m_serialNumber;
}

QString SerialInfo::vendor() const
{
    return m_vendor;
}

QString SerialInfo::indentifier() const
{
    return m_indentifier;
}
