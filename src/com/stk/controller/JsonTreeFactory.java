package com.stk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stk.entity.Type;

public class JsonTreeFactory {

	public static List<Type> buildtree(List<Type> nodes,int id){  
        List<Type> treeNodes=new ArrayList<Type>();  
        for (Type treeNode : nodes) {  
        	Type node=new Type();  
            node.setID(treeNode.getID());  
            node.setTypeName(treeNode.getTypeName());  
            if(id==treeNode.getParentID()){  
                node.setChildren(buildtree(nodes, node.getID()));  
                treeNodes.add(node);  
            }  
              
        }  
        return treeNodes;  
    }  
      
}
