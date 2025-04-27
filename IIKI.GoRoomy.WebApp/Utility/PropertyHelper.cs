using IIKI.BaseApp.Utils;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;
using System.Web;

namespace IIKI.GoRoomy.WebApp.Utility
{
    public static class PropertyHelper
    {
        public static IEnumerable<PropertyInfo> GetOrderedBaseFieldProperties(object model)
        {
            if (model == null)
            {
                return Enumerable.Empty<PropertyInfo>();
            }

            var type = model.GetType();
            var properties = type.GetProperties()
                .Where(p =>
                {
                    var attributes = p.GetCustomAttributes(true);
                    return attributes.OfType<BaseFieldAttribute>().Any() &&
                           !attributes.OfType<NotMappedAttribute>().Any();
                })
                .OrderBy(p => p.GetCustomAttributes(true).OfType<BaseFieldAttribute>().First().FieldOrderOnForm);

            return properties;
        }

        public static IEnumerable<PropertyInfo> GetOrderedEditFormProperties(object model)
        {
            if (model == null)
            {
                return Enumerable.Empty<PropertyInfo>();
            }

            var type = model.GetType();
            var properties = type.GetProperties()
                .Where(p =>
                {
                    var baseFieldAttributes = p.GetCustomAttributes<BaseFieldAttribute>(true);
                    return baseFieldAttributes.Any(ca => ca.IsShowOnForm);
                })
                .OrderBy(p =>
                {
                    var attribute = p.GetCustomAttributes<BaseFieldAttribute>(true).FirstOrDefault();
                    return attribute?.FieldOrderOnForm ?? float.MaxValue; // Handles nullable FieldOrderOnForm
                });

            return properties;
        }

        public static IEnumerable<PropertyInfo> GetHiddenFields(object model)
        {
            if (model == null)
            {
                return Enumerable.Empty<PropertyInfo>();
            }

            var type = model.GetType();
            var properties = type.GetProperties()
                .Where(p =>
                {
                    var baseFieldAttributes = p.GetCustomAttributes<BaseFieldAttribute>(true);
                    return baseFieldAttributes.Any(ca => ca.RenderMode == BaseApp.Common.InputRenderModes.Hidden);
                })
                .OrderBy(p => p.GetCustomAttributes<BaseFieldAttribute>(true).First().FieldOrderOnForm);

            return properties;
        }

        public static IEnumerable<PropertyInfo> GetOrderedTableProperties(object model)
        {
            if (model == null)
            {
                return Enumerable.Empty<PropertyInfo>();
            }

            var type = model.GetType();
            var properties = type.GetProperties()
                .Where(p =>
                {
                    var attributes = p.GetCustomAttributes<BaseFieldAttribute>(true);
                    return (attributes.OfType<BaseFieldAttribute>().Any(ca => ca.IsShowInGrid && ca.IsShowOnForm) &&
                           !attributes.OfType<NotMappedAttribute>().Any() &&
                           !attributes.OfType<NonSavedFieldAttribute>().Any()) ||
                           attributes.OfType<ReadOnlyFieldAttribute>().Any(x => x.IsShowInGrid) ||
                           attributes.OfType<DataFieldAttribute>().Any(x => x.IsShowInGrid)
                           ;
                })
                .OrderBy(p => p.GetCustomAttributes<BaseFieldAttribute>(true).First().FieldOrderInGrid)
                .OrderBy(p => p.GetCustomAttributes<BaseFieldAttribute>(true).First().FieldOrderOnForm);

            return properties;
        }

        public static IEnumerable<PropertyInfo> GetOrderedSearchFormProperties(object model)
        {
            if (model == null)
            {
                return Enumerable.Empty<PropertyInfo>();
            }

            var type = model.GetType();
            var properties = type.GetProperties()
                .Where(p =>
                {
                    var baseFieldAttributes = p.GetCustomAttributes<BaseFieldAttribute>(true);
                    return baseFieldAttributes.Any(ca => ca.IsSearchableField);
                })
                .OrderBy(p =>
                {
                    var attribute = p.GetCustomAttributes<BaseFieldAttribute>(true).FirstOrDefault();
                    return attribute?.FieldOrderOnForm ?? float.MaxValue; // Handles nullable FieldOrderOnForm
                });

            return properties;
        }
        public static long GetRecordId(object model)
        {
            if (model == null) return 0;

            var type = model.GetType();
            var idProperty = type.GetProperties().FirstOrDefault(x => x.Name == "Id");

            if (idProperty == null) return 0;

            var value = idProperty.GetValue(model, null);

            return value is long longValue ? longValue : 0;
        }

        public static IEnumerable<PropertyInfo> GetPropertyValue(object model)
        {
            if (model == null)
            {
                return Enumerable.Empty<PropertyInfo>();
            }

            var type = model.GetType();
            var properties = type.GetProperties()
                .Where(p =>
                {
                    var attributes = p.GetCustomAttributes<BaseFieldAttribute>(true);
                    return attributes.OfType<BaseFieldAttribute>().Any(ca => ca.IsShowOnForm) &&
                           !attributes.OfType<NotMappedAttribute>().Any();
                })
                .OrderBy(p => p.GetCustomAttributes<BaseFieldAttribute>(true).First().FieldOrderOnForm);

            return properties;
        }
    }
}