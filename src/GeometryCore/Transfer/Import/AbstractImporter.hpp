#ifndef AbstractImporter_hpp
#define AbstractImporter_hpp

#include "AbstractProgressPublisher.hpp"
#include "DocumentGeometry.hpp"

class AbstractImporter {
   public:
    AbstractImporter(const AbstractImporter&) = default;
    AbstractImporter(AbstractImporter&&) = delete;
    AbstractImporter& operator=(const AbstractImporter&) = default;
    AbstractImporter& operator=(AbstractImporter&&) = delete;
    virtual ~AbstractImporter() = default;
    virtual void importIntoDoc(
        DocumentGeometry& aDestDoc,
        AbstractProgressPublisher& aProgressPublisher) = 0;
};

#endif
