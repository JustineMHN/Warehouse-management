#include "productModel.h"

Product::Product(QObject *parent)
    : QObject{parent}
{

}

QString Product::code() const
{
    return m_code;
}

void Product::setCode(const QString &newCode)
{
    m_code = newCode;
}

QString Product::name() const
{
    return m_name;
}

void Product::setName(const QString &newName)
{
    m_name = newName;
}

QString Product::description() const
{
    return m_description;
}

void Product::setDescription(const QString &newDescription)
{
    m_description = newDescription;
}

int Product::category() const
{
    return m_category;
}

void Product::setCategory(int newCategory)
{
    m_category = newCategory;
}

QString Product::measure() const
{
    return m_measure;
}

void Product::setMeasure(const QString &newMeasure)
{
    m_measure = newMeasure;
}

double Product::quantity() const
{
    return m_quantity;
}

void Product::setQuantity(double newQuantity)
{
    m_quantity = newQuantity;
}

double Product::price() const
{
    return m_price;
}

void Product::setPrice(double newPrice)
{
    m_price = newPrice;
}

Product::Product(const QString &code, const QString &name, const QString &description, int category, const QString &measure, double quantity, double price) : m_code(code),
    m_name(name),
    m_description(description),
    m_category(category),
    m_measure(measure),
    m_quantity(quantity),
    m_price(price)
{}

void Product::addNewProduct(QString m_code, QString m_name, QString m_description, int m_category, QString m_measure, double m_quantity, double m_price)
{
    emit productAdded(m_code, m_name, m_description, m_category, m_measure, m_quantity, m_price);
}
